require "unirest"
require "io/console"

system "clear"

puts "[1] Sign Up"
puts "[2] Log In"
puts "[3] Log Out"
input_option = gets.chomp

if input_option == "1"
  # Sign up
  params = {}
    print "Enter name: "
    params[:name] = gets.chomp
    print "Enter email: "
    params[:email] = gets.chomp
    print "Enter password: "
    params[:password] = STDIN.noecho(&:gets).chomp
    print "Enter password again: "
    params[:password_confirmation] = STDIN.noecho(&:gets).chomp
    response = Unirest.post("http://localhost:3000/v1/users", parameters: params)
  p response.body
elsif input_option == "2"
  # Log In
  print "Enter email: "
  input_username = gets.chomp
  print "Enter password: "
  input_password = STDIN.noecho(&:gets).chomp
  response = Unirest.post(
    "http://localhost:3000/user_token",
    parameters: {
      auth: {
        email: "#{input_username}",
        password: "#{input_password}"
      }
    }
  )
  # Save the JSON web token from the response
  jwt = response.body["jwt"]
  # Include the jwt in the headers of any future web requests
  Unirest.default_header("Authorization", "Bearer #{jwt}")
elsif input_option == "3"
  # Log Out
  jwt = ""
  Unirest.clear_default_headers()
end
system "clear"

puts "(1) View all products"
puts "(1.1) Search for products by term"
puts "(1.2) Sort products by price"
puts "(1.3) Search for products by category"
puts "(2) Create a product"
puts "(3) View a specific product by ID"
puts "(4) Update a product"
puts "(5) Delete a product"
puts "(6) Start order"
puts "(7) View orders"
input_option = gets.chomp


if input_option == "1"
  # View all products
  response = Unirest.get("http://localhost:3000/v1/products")
  products = response.body
  puts JSON.pretty_generate(products)
elsif input_option == "1.1"
  # Search for products
  print "Enter a search: "
  search_term = gets.chomp
  response = Unirest.get("http://localhost:3000/v1/products?search_term=#{search_term}")
  product = response.body
  puts JSON.pretty_generate(product)  
elsif input_option == "1.2"
  # Sort products by price
  response = Unirest.get("http://localhost:3000/v1/products?sort_by_price=true")
  products = response.body
  puts JSON.pretty_generate(products)
elsif input_option == "1.3"
  # Show products in category
  print "Enter a category: "
  search_category = gets.chomp
  response = Unirest.get("http://localhost:3000/v1/products?search_category=#{search_category}")
  products = response.body
  puts JSON.pretty_generate(products)
elsif input_option == "2"
  # Create a product
  params = {}
  print "Product name: "
  params["name"] = gets.chomp
  print "Product price: "
  params["price"] = gets.chomp
  print "Product In-Stock (true or false): "
  params["in_stock"] = gets.chomp
  print "Product description: "
  params["description"] = gets.chomp
  response = Unirest.post("http://localhost:3000/v1/products", parameters: params)
  product = response.body
  puts JSON.pretty_generate(product)
elsif input_option == "3"
  # View a specific product by ID
  print "Enter a product ID: "
  product_id = gets.chomp
  response = Unirest.get("http://localhost:3000/v1/products/#{product_id}")
  product = response.body
  puts JSON.pretty_generate(product)
elsif input_option == "4"
  # Update a product
  print "Enter a product ID: "
  product_id = gets.chomp
  response = Unirest.get("http://localhost:3000/v1/products/#{product_id}")
  product = response.body
  params = {}
  print "Product name (#{product["name"]}): "
  params[:name] = gets.chomp
  print "Product price (#{product["price"]}): "
  params[:price] = gets.chomp
  print "Product In-Stock (true or false) (#{product["in_stock"]}): "
  params[:in_stock] = gets.chomp
  print "Product description (#{product["description"]}): "
  params[:description] = gets.chomp
  params.delete_if { |_key, value| value.empty? }
  response = Unirest.patch("http://localhost:3000/v1/products/#{product_id}", parameters: params)
  product = response.body
  puts JSON.pretty_generate(product)
elsif input_option == "5"
  # Delete a product
  print "Enter a product ID: "
  product_id = gets.chomp
  response = Unirest.delete("http://localhost:3000/v1/products/#{product_id}")
  product = response.body
  puts JSON.pretty_generate(product)
elsif input_option == "6"
  # Start order
  params = {}
  print "Enter a product ID: "
  params[:product_id] = gets.chomp
  print "Enter a quantity: "
  params[:quantity] = gets.chomp
  response = Unirest.post("http://localhost:3000/v1/orders", parameters: params)
  order = response.body
  puts JSON.pretty_generate(order)
elsif input_option == "7"
  # View orders
  response = Unirest.post("http://localhost:3000/v1/orders")
  orders = response.body
  puts JSON.pretty_generate(orders)
end