class V1::ProductsController < ApplicationController
  def index
    # products = Product.all
    render json: Product.all.sort.as_json
  end

  def create
    product = Product.new(
      name: params["name"],
      price: params["price"],
      image_url: params["image_url"],
      description: params["description"]
    )
    product.save
    render json: product.as_json
  end

  def show
    # text = Product.find_by(id: params["id"])
    render json: Product.find_by(id: params["id"]).as_json
  end

  def update
    product_id = params["id"]
    product = Product.find_by(id: product_id)
    product.name = params["name"]
    product.price = params["price"]
    product.image_url = params["image_url"]
    product.description = params["description"]
    product.save
    render json: product.as_json
  end

  def destroy
    product_id = params["id"]
    product = Product.find_by(id: product_id)
    product.destroy
    render json: {message: "Product has been removed."}
  end
  # replaced by show method
  # def oven
  #   product = Product.find_by(name: "oven")
  #   render json: product.as_json
  # end
  # def microwave
  #   product = Product.find_by(name: "microwave")
  #   render json: product.as_json
  # end
  # def refridgerator
  #   product = Product.find_by(name: "refridgerator")
  #   render json: product.as_json
  # end
  # def toaster
  #   product = Product.find_by(name: "toaster")
  #   render json: product.as_json
  # end
end