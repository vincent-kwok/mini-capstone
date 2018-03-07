require "unirest"

system "clear"

response = Unirest.get("http://localhost:3000/all_products")
products = response.body
puts JSON.pretty_generate(products)



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

