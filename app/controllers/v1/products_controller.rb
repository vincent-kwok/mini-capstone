class V1::ProductsController < ApplicationController
  def index
    # products = Product.all
    render json: Product.all.sort.as_json
  end

  def create
    product = Product.new(
      name: params["name"],
      price: params["price"],
      in_stock: params["in_stock"],
      image_url: params["image_url"],
      description: params["description"]
    )
    if product.save
      render json: product.as_json
    else
      render json: { message: product.errors.full_messages }, status: 422
    end
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
    product.in_stock = params["in_stock"]
    product.image_url = params["image_url"]
    product.description = params["description"]
    product.save
    if product.save
      render json: product.as_json
    else
      render json: { message: product.errors.full_messages}, status: 422
    end
  end

  def destroy
    product_id = params["id"]
    product = Product.find_by(id: product_id)
    product.destroy
    render json: { message: "Product has been removed." }
  end
end