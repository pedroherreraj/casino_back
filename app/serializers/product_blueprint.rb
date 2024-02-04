class ProductBlueprint < Blueprinter::Base
  identifier :id
  view :full_info do
    fields :name
    field :net_price do |object, _|
      object.net_price
    end
  end
end
