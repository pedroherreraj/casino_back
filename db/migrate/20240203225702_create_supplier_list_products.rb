class CreateSupplierListProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :supplier_list_products do |t|
      t.belongs_to :supplier
      t.belongs_to :product
      t.string :supplier_product_name
      t.integer :measurement_unit
      t.integer :units_per_display
      t.integer :unit_format
      t.integer :net_price
      t.date :price_date
      t.boolean :active
      t.boolean :need_transformation
      t.timestamps
    end
  end
end
