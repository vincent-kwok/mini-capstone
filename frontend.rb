require "unirest"
require "io/console"

puts "Choose an option:"
puts "[1] Signup"
puts "[2] Login"
puts "[3] Logout"

input_option = gets.chomp
if input_option == "1"
  params = {}
    print "Enter name: "
    params[:name] = gets.chomp
    print "Enter email: "
    params[:email] = gets.chomp
    print "Enter password: "
    params[:password] = gets.chomp
    print "Enter password again: "
    params[:password_confirmation] = gets.chomp
    response = Unirest.post("http://localhost:3000/v1/users", parameters: params)
  p response.body
elsif input_option == "2"
  print "Enter email: "
  input_username = gets.chomp
  print "Enter password: "
  input_password = gets.chomp
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
  jwt = ""
  Unirest.clear_default_headers()
end

puts "Welcome to Vince's Store! How can I help you?"
puts "(1) View all products"
puts "(2) Search for products"
puts "(3) View a specific product by ID"
puts "(4) Create a product"
puts "(5) Update a product"
puts "(6) Delete a product"
puts "(0) Create a user"
puts "(20) Start order"
puts "(21) View order"

input_option = gets.chomp
if input_option == "1"
  response = Unirest.get("http://localhost:3000/v1/products")
  products = response.body
  puts JSON.pretty_generate(products)
  # puts "To sort by price, type 1"
  # sort_by_price = gets.chomp
  # if sort_by_price == "1"
  #   products = products.order(price: :asc)
  # end    
elsif input_option == "2"
  # Search for products
  print "Enter a search: "
  search_terms = gets.chomp
  response = Unirest.get("http://localhost:3000/v1/products?search_terms=#{search_terms}")
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
elsif input_option == "5"
  #Update a product
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
elsif input_option == "6"
  # Delete a product
  print "Enter a product ID: "
  product_id = gets.chomp
  response = Unirest.delete("http://localhost:3000/v1/products/#{product_id}")
  product = response.body
  puts JSON.pretty_generate(product)
elsif input_option == "0"
  # Create a user
  params = {}
  print "Enter user's name: "
  params[:name] = gets.chomp
  print "Enter user's email: "
  params[:email] = gets.chomp
  print "Enter password: "
  params[:password] = STDIN.noecho(&:gets).chomp
  print "Enter password again: "
  params[:password_confirmation] = STDIN.noecho(&:gets).chomp
  response = Unirest.post("http://localhost:3000/v1/users", parameters: params)
  user = response.body
  puts JSON.pretty_generate(user)
elsif input_option == "20"
  # Start order
  params = {}
  # params[:user_id] = user_id
  print "Enter a product ID: "
  params[:product_id] = gets.chomp
  print "Enter a quantity: "
  params[:quantity] = gets.chomp
  response = Unirest.post("http://localhost:3000/v1/orders", parameters: params)
  order = response.body
  puts JSON.pretty_generate(order)
elsif input_option == "21"
  # View order
  response = Unirest.post("http://localhost:3000/v1/orders")
  orders = response.body
  puts JSON.pretty_generate(orders)
end