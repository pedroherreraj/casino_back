class ProductBlueprint < Blueprinter::Base
  identifier :id
  view :full_info do
    fields :name
  end
end