class CreateSuppliers < ActiveRecord::Migration[7.0]
  def change
    create_table :suppliers do |t|
      t.string :name
      t.string :tax_id
      t.string :legal_name
      t.string :activity
      t.string :address
      t.string :delivery_days
      t.timestamps
    end
  end
end
