class V1::ProductsController < ApplicationController
  def index
    products = Product.all
    render json: products.as_json
  end

  def show
    # text = Product.find_by(id: params["id"])
    render json: Product.find_by(id: params["id"]).as_json
  end

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