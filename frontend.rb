require "unirest"

system "clear"

puts "Welcome to Vince's Store! How can I help you?"
puts "(1) View all products"
puts "(2) View a specific product"
puts "(3) Create a product"

input_option = gets.chomp
if input_option == "1"
  system "clear"
  puts JSON.pretty_generate(Unirest.get("http://localhost:3000/v1/products").body)
elsif input_option == "2"
  print "Enter a recipe id: "
  product_id = gets.chomp
  system "clear"
  puts JSON.pretty_generate(Unirest.get("http://localhost:3000/v1/products/#{product_id}").body)
elsif input_option == "3"
  print "Enter a product name: "
  input_name = gets.chomp
  print "Enter a product price: "
  input_price = gets.chomp
  print "Enter a product image: "
  input_image_url = gets.chomp.to_i
  print "Enter a product description: "
  input_description = gets.chomp
  params = {
    "name" => "#{input_name}",
    "price" => input_price,
    "image_url" => "#{input_image_url}",
    "description" => "#{input_description}"
  }
  system "clear"
  puts JSON.pretty_generate(Unirest.post("http://localhost:3000/v1/products", parameters: params).body)
end  
# prints hash to terminal
# response = Unirest.get("http://localhost:3000/all_products")
# products = response.body
# puts JSON.pretty_generate(products)


# tried to create table
# table = TTY::Table.new ['Name', 'Price', 'Link', 'Description']
#   ['header1','header2','header3','header4'], [
#     ['a1', 'a2', 'a3', 'a4'], 
#     ['b1', 'b2', 'a3', 'a4'],
#     ['c1', 'c2', 'a3', 'a4'], 
#     ['d1', 'd2', 'a3', 'a4'],
#     ['e1', 'e2', 'a3', 'a4'], 
#     ['f1', 'f2', 'a3', 'a4'],
#     ['g1', 'g2', 'a3', 'a4'],
#   ]
# table.render(:ascii)
# =>
#  +-------+-------+-------+-------+
#  |header1|header2|header3|header4|
#  +-------+-------+-------+-------+
#  |a1     |a2     |a3     |a4     |
#  +-------+-------+-------+-------+
#  |b1     |b2     |b3     |b4     |
#  +-------+-------+-------+-------+
#  |c1     |c2     |c3     |c4     |
#  +-------+-------+-------+-------+
#  |d1     |d2     |d3     |d4     |
#  +-------+-------+-------+-------+
#  |e1     |e2     |e3     |e4     |
#  +-------+-------+-------+-------+
#  |f1     |f2     |f3     |f4     |
#  +-------+-------+-------+-------+
#  |g1     |g2     |g3     |g4     |
#  +-------+-------+-------+-------+

