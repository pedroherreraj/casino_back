module Api
  module V1
    class ProductsController < ApiController
      def index
        json_res(Product.convenient_product, serializer: ProductBlueprint, view: :full_info)
      end
    end
  end
end
