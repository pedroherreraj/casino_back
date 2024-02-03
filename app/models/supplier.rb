class Supplier < ApplicationRecord
  has_and_belongs_to_many :product_categories
end
