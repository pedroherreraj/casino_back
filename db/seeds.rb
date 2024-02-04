# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

agrosuper = Supplier.where(name: 'Agrosuper').first_or_create(name: 'Agrosuper')
cyp = Supplier.where(name: 'C y P').first_or_create(name: 'C y P')
icb = Supplier.where(name: 'ICB').first_or_create(name: 'ICB')
protein = ProductCategory.where(name: 'protein').first_or_create(name: 'protein')
meet = ProductSubCategory.where(name: 'meet').first_or_create(name: 'meet')
chicken = ProductSubCategory.where(name: 'chicken').first_or_create(name: 'chicken')
pork = ProductSubCategory.where(name: 'pork').first_or_create(name: 'pork')
turky = ProductSubCategory.where(name: 'turky').first_or_create(name: 'turky')

agrosuper.product_categories << protein
cyp.product_categories << protein
icb.product_categories << protein

costillar = Product.where(name: 'Costillar USA').first_or_create(name: 'Costillar USA', product_sub_category: pork)
chuleta = Product.where(name: 'Chuleta Centro').first_or_create(name: 'Chuleta Centro', product_sub_category: pork)
lomo_centro = Product.where(name: 'Lomo Centro').first_or_create(name: 'Lomo Centro', product_sub_category: pork)
pulpa = Product.where(name: 'Pulpa').first_or_create(name: 'Pulpa', product_sub_category: pork)
pechuga = Product.where(name: 'Pechuga Deshuesada').first_or_create(name: 'Pechuga Deshuesada', product_sub_category: chicken)
truto = Product.where(name: 'Truto Entero').first_or_create(name: 'Truto Entero', product_sub_category: chicken)
posta_negra = Product.where(name: 'Posta Negra').first_or_create(name: 'Posta Negra', product_sub_category: meet)
huachalomo = Product.where(name: 'Huachalomo').first_or_create(name: 'Huachalomo', product_sub_category: meet)
plateada = Product.where(name: 'Plateada').first_or_create(name: 'Plateada', product_sub_category: meet)

costillar = Product.where(name: 'Costillar USA').first_or_create(name: 'Costillar USA', product_sub_category: pork)
chuleta = Product.where(name: 'Chuleta Centro').first_or_create(name: 'Chuleta Centro', product_sub_category: pork)
lomo_centro = Product.where(name: 'Lomo Centro').first_or_create(name: 'Lomo Centro', product_sub_category: pork)
pulpa = Product.where(name: 'Pulpa').first_or_create(name: 'Pulpa', product_sub_category: pork)
pechuga = Product.where(name: 'Pechuga Deshuesada').first_or_create(name: 'Pechuga Deshuesada', product_sub_category: chicken)
truto = Product.where(name: 'Truto Entero').first_or_create(name: 'Truto Entero', product_sub_category: chicken)
posta_negra = Product.where(name: 'Posta Negra').first_or_create(name: 'Posta Negra', product_sub_category: meet)
huachalomo = Product.where(name: 'Huachalomo').first_or_create(name: 'Huachalomo', product_sub_category: meet)
plateada = Product.where(name: 'Plateada').first_or_create(name: 'Plateada', product_sub_category: meet)

costillar_cyp = SupplierProduct.create(
  supplier: cyp,
  product: costillar,
  price_date: '2024-01-30'.to_date,
  net_price: 4890
)
costillar_cyp = SupplierProduct.create(
  supplier: icb,
  product: costillar,
  price_date: '2024-01-30'.to_date,
  net_price: 3890
)
