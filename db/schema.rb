# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_02_03_225702) do
  create_table "product_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "product_categories_suppliers", id: false, force: :cascade do |t|
    t.integer "product_category_id"
    t.integer "supplier_id"
    t.index ["product_category_id"], name: "index_product_categories_suppliers_on_product_category_id"
    t.index ["supplier_id"], name: "index_product_categories_suppliers_on_supplier_id"
  end

  create_table "product_sub_categories", force: :cascade do |t|
    t.integer "product_category_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_category_id"], name: "index_product_sub_categories_on_product_category_id"
  end

  create_table "products", force: :cascade do |t|
    t.integer "product_sub_category_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_sub_category_id"], name: "index_products_on_product_sub_category_id"
  end

  create_table "supplier_products", force: :cascade do |t|
    t.integer "supplier_id"
    t.integer "product_id"
    t.string "supplier_product_name"
    t.integer "measurement_unit"
    t.integer "units_per_display"
    t.integer "unit_format"
    t.integer "net_price"
    t.date "price_date"
    t.boolean "active"
    t.boolean "need_transformation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_supplier_products_on_product_id"
    t.index ["supplier_id"], name: "index_supplier_products_on_supplier_id"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "name"
    t.string "tax_id"
    t.string "legal_name"
    t.string "activity"
    t.string "address"
    t.string "delivery_days"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
