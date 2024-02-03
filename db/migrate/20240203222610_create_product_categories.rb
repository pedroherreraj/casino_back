class CreateProductCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :product_categories do |t|
      t.string :name
      t.timestamps
    end

    create_table :product_categories_suppliers, id: false do |t|
      t.belongs_to :product_category
      t.belongs_to :supplier
    end
  end
end
