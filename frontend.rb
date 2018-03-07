require "unirest"

system "clear"

response = Unirest.get("http://localhost:3000/all_products")
products = response.body
puts JSON.pretty_generate(products)

# puts "(1) Show all products"
# puts "(2) Show one product"
# choice = gets.chomp
# if choice == "1"
#   response = Unirest.get("http://localhost:3000/all_products")
#   products = response.body
#   puts JSON.pretty_generate(products)
# elsif choice == "2"
#   puts "Which product would you like to see?"
# end