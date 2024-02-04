class SupplierListProduct < ApplicationRecord
  belongs_to :supplier
  belongs_to :product
  after_save :update_convenient_product

  private

  def update_convenient_product
    convenient_product = product.convenient_product
    return unless convenient_product.nil? || convenient_product.net_price >= net_price

    convenient_product.update_column(:active, false)
    update_column(:active, true)
  end
end
