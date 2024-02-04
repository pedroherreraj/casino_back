class Product < ApplicationRecord
  include ActionView::Helpers
  belongs_to :product_sub_category
  has_many :supplier_list_products
  has_many :suppliers, through: :supplier_list_products
  scope :convenient_product, -> { joins(:supplier_list_products).where(supplier_list_products: { active: true } )}

  def convenient_product
    supplier_list_products.find_by active: true
  end

  def net_price # NO FUNCIONA EL SEPARADOR QL
    number_to_currency(convenient_product.net_price, separator: ".", delimeter: '.',unit: '', precision: 0)
  end
end
