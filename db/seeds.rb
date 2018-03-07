# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
product = Product.new({name: "oven", price: 600, image_url: "https://png.pngtree.com/element_origin_min_pic/16/12/01/edc8abc949ca361f8471265c562bb8c7.jpg", description: "oven with 4 burners"})
product.save
product = Product.new({name: "microwave", price: 100, image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_o5F9Os1d6A_R8NMycX41097tWnBqut2c1r7PkFjfIWcOFFss", description: "microwave with rotating table"})
product.save
product = Product.new({name: "refridgerator", price: 1000, image_url: "https://image.shutterstock.com/z/stock-vector-fridge-freezer-cartoon-53102797.jpg", description: "refridgerator with freezer"})
product.save
product = Product.new({name: "toaster", price: 20, image_url: "https://previews.123rf.com/images/lineartestpilot/lineartestpilot1402/lineartestpilot140201129/25555174-cartoon-toaster.jpg", description: "toaster with 2 slots"})
product.save
product = Product.new({name: "dish washer", price: 400, image_url: "https://png.pngtree.com/element_origin_min_pic/17/03/16/c63581fa2bd96cd882fdffbeff5d3f39.jpg", description: "programmer dish washer"})
product.save
product = Product.new({name: "coffee maker", price: 20, image_url: "https://i.pinimg.com/474x/6c/43/d5/6c43d5c350da60933f57238461220f79--cartoon-picture-art-house.jpg", description: "multiple cup coffee maker"})
product.save
product = Product.new({name: "mixer", price: 80, image_url: "https://png.pngtree.com/element_origin_min_pic/16/12/03/439c307401c1d67e128ff1391f9ce6fd.jpg", description: "mixer with multi-speeds"})
product.save