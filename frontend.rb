require "unirest"

system "clear"

puts "Welcome to Vince's Store! How can I help you?"
puts "(1) View all products"
puts "(2) View a specific product"
puts "(3) Create a product"
puts "(4) Update a product"
puts "(5) Delete a product"

input_option = gets.chomp
if input_option == "1"
  response = Unirest.get("http://localhost:3000/v1/products")
  products = response.body
  puts JSON.pretty_generate(products)
elsif input_option == "2"
  print "Enter a product ID: "
  product_id = gets.chomp
  response = Unirest.get("http://localhost:3000/v1/products/#{product_id}")
  product = response.body
  puts JSON.pretty_generate(product)
elsif input_option == "3"
  params = {}
  print "Product name: "
  params["name"] = gets.chomp
  print "Product price: "
  params["price"] = gets.chomp
  print "Product In-Stock (true or false): "
  params["in_stock"] = gets.chomp
  print "Product image URL: "
  params["image_url"] = gets.chomp
  print "Product description: "
  params["description"] = gets.chomp
  response = Unirest.post("http://localhost:3000/v1/products", parameters: params)
  product = response.body
  puts JSON.pretty_generate(product)
elsif input_option == "4"
  print "Enter a product ID: "
  product_id = gets.chomp
  response = Unirest.get("http://localhost:3000/v1/products/#{product_id}")
  product = response.body
  params = {}
  print "Product name: "
  params["name"] = gets.chomp
  print "Product price: "
  params["price"] = gets.chomp
  print "Product In-Stock (true or false): "
  params["in_stock"] = gets.chomp
  print "Product image URL: "
  params["image_url"] = gets.chomp
  print "Product description: "
  params["description"] = gets.chomp
  params.delete_if { |_key, value| value.empty? }
  response = Unirest.patch("http://localhost:3000/v1/products/#{product_id}", parameters: params)
  product = response.body
  puts JSON.pretty_generate(product)
elsif input_option == "5"
  print "Enter a product ID: "
  product_id = gets.chomp
  response = Unirest.delete("http://localhost:3000/v1/products/#{product_id}")
  product = response.body
  puts JSON.pretty_generate(product)
end