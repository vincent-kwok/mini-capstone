require "unirest"

system "clear"

puts "Welcome to Vince's Store! How can I help you?"
puts "(1) View all products"
puts "(2) Search for products"
puts "(3) View a specific product by ID"
puts "(4) Create a product"
puts "(5) Update a product"
puts "(6) Delete a product"

input_option = gets.chomp
if input_option == "1"
  response = Unirest.get("http://localhost:3000/v1/products")
  products = response.body
  puts JSON.pretty_generate(products)
  puts "To sort by price, type 1"
  sort_by_price = gets.chomp
  if sort_by_price == "1"
    
    
elsif input_option == "2"
  print "Enter a search: "
  search_terms = gets.chomp
  response = Unirest.get("http://localhost:3000/v1/products?search_terms=#{search_terms}")
  product = response.body
  puts JSON.pretty_generate(product)  
elsif input_option == "3"
  print "Enter a product ID: "
  product_id = gets.chomp
  response = Unirest.get("http://localhost:3000/v1/products/#{product_id}")
  product = response.body
  puts JSON.pretty_generate(product)
elsif input_option == "4"
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
elsif input_option == "5"
  print "Enter a product ID: "
  product_id = gets.chomp
  response = Unirest.get("http://localhost:3000/v1/products/#{product_id}")
  product = response.body
  params = {}
  print "Product name (#{product["name"]}): "
  params["name"] = gets.chomp
  print "Product price (#{product["price"]}): "
  params["price"] = gets.chomp
  print "Product In-Stock (true or false) (#{product["in_stock"]}): "
  params["in_stock"] = gets.chomp
  print "Product image URL (#{product["image_url"]}): "
  params["image_url"] = gets.chomp
  print "Product description (#{product["description"]}): "
  params["description"] = gets.chomp
  params.delete_if { |_key, value| value.empty? }
  response = Unirest.patch("http://localhost:3000/v1/products/#{product_id}", parameters: params)
  product = response.body
  puts JSON.pretty_generate(product)
elsif input_option == "6"
  print "Enter a product ID: "
  product_id = gets.chomp
  response = Unirest.delete("http://localhost:3000/v1/products/#{product_id}")
  product = response.body
  puts JSON.pretty_generate(product)
end