require "unirest"

system "clear"

response = Unirest.get("http://localhost:3000/all_products")
