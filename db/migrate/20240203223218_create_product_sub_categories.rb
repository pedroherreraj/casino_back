class CreateProductSubCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :product_sub_categories do |t|
      t.belongs_to :product_category
      t.string :name
      t.timestamps
    end
  end
end
