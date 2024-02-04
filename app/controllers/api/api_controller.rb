module Api
  class ApiController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :bad_request
    rescue_from ActionController::ParameterMissing, with: :bad_request
    rescue_from ArgumentError, with: :bad_request

    def page_meta(resources)
      { pages: resources.total_pages, current: resources.current_page, total: resources.total_count }
    end

    def json_res(resource, opts = {})
      serializer = (opts[:serializer] || serializer_for(resource))
      if serializer
        opts[:root] ||= :data
        opts[:meta] = (opts[:meta] || {}).merge(page_meta(resource)) if defined?(resource.total_pages)
        error_response(resource, opts) if resource.respond_to?(:errors) && resource.errors.any?
        return render json: serializer.render(resource, opts), status: opts[:status] || 200
      end
      render json: resource, status: opts[:status] || 400
    end

    def not_found
      render json: {
        'errors': [
          {
            'status': '404',
            'title': 'Not Found'
          }
        ]
      }, status: 404
    end

    private

    def error_response(resource, opts)
      opts[:meta] = (opts[:meta] || {}).merge(
        { errors: Hash[resource.errors.collect { |e| [e.attribute, e.full_message] }] }
      )
      opts[:status] ||= 400
    end

    def serializer_for(resource)
      blueprint = 'A'
      if resource.respond_to?(:klass)
        blueprint = "#{resource.klass.name}Blueprint"
      elsif resource.respond_to?(:class)
        blueprint = "#{resource.class.name}Blueprint"
      end
      return nil unless Object.const_defined?(blueprint)

      blueprint.constantize
    end

    def forbidden
      render json: { error: { code: 401, message: 'Invalid credentials.' } }, status: :unauthorized
    end

    def record_not_found
      render json: { error: { code: 404, message: 'Record not found.' } }, status: :not_found
    end

    def bad_request(exception)
      render json: { error: { code: 400, message: exception.message } }, status: :bad_request
    end

    def invalid_params(message)
      render json: { error: { code: 400, message: message } }, status: :bad_request
    end

    def model_errors(errors)
      formatted_errors = []

      errors.messages.each do |attribute, messages|
        formatted_errors << messages.map { |message| "#{attribute.to_s.humanize} #{message}" }
      end

      render json: { error: { code: 400, messages: formatted_errors.flatten.join('. ') } }, status: :bad_request
    end

    def nested_model_errors(model, errors)
      render json: { error: { code: 400, message: { "#{model}": errors.full_messages_for(errors.keys.first).first } } }, status: :bad_request
    end

    def invalid_action(message)
      render json: { error: { code: 400, message: message } }, status: :bad_request
    end
  end
end
