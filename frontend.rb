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
  puts JSON.pretty_generate(Unirest.get("http://localhost:3000/v1/products").body)
elsif input_option == "2"
  print "Enter a product ID: "
  product_id = gets.chomp
  puts JSON.pretty_generate(Unirest.get("http://localhost:3000/v1/products/#{product_id}").body)
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
  puts JSON.pretty_generate(Unirest.post("http://localhost:3000/v1/products", parameters: params).body)
elsif input_option == "4"
  print "Enter a product ID: "
  product_id = gets.chomp
  response = Unirest.get("http://localhost:3000/v1/products/#{product_id}")
  contact = response.body
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
  puts JSON.pretty_generate(Unirest.patch("http://localhost:3000/v1/products/#{product_id}", parameters: params).body)
elsif input_option == "5"
  print "Enter a product ID: "
  product_id = gets.chomp
  puts JSON.pretty_generate(Unirest.delete("http://localhost:3000/v1/products/#{product_id}").body)
end