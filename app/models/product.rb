class Product < ApplicationRecord
  belongs_to :product_sub_category
  has_many :supplier_products
  has_many :suppliers, through: :supplier_products
end
