Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/all_products" => "products#all_products"
  get "/oven" => "products#oven"
  get "/microwave" => "products#microwave"
  get "/refridgerator" => "products#refridgerator"
  get "/toaster" => "products#toaster"
end