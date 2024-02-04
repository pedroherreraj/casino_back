class ProductCategory < ApplicationRecord
  has_and_belongs_to_many :suppliers
  has_many :product_sub_categories
end
