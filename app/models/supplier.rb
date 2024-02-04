class Supplier < ApplicationRecord
  has_and_belongs_to_many :product_categories
  has_many :supplier_products
  has_many :products, through: :supplier_products
end
