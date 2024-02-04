class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.belongs_to :product_sub_category
      t.string :name
      t.timestamps
    end
  end
end