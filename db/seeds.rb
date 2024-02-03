# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

supplier = Supplier.create(name: 'Agrosuper')
protein = ProductCategory.create(name: 'protein')
meet = ProductSubCategory.create(name: 'meet')
chicken = ProductSubCategory.create(name: 'chicken')
pork = ProductSubCategory.create(name: 'pork')
turky = ProductSubCategory.create(name: 'turky')

supplier.product_categories << protein