class V1::ProductsController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]
  
  def index
    products = Product.all

    search_terms = params[:q]
    if search_terms
      products = products.where("name ILIKE ?", "%#{search_terms}%")
    end
    sort_by_price = params[:sort_by_price]
    if sort_by_price
      products = products.order(price: :asc)
    else
      products = products.order(id: :asc)
    end
    render json: products.as_json
  end

  def create
    product = Product.new(
      name: params[:name],
      price: params[:price],
      in_stock: params[:in_stock],
      description: params[:description],
      supplier_id: 1
    )
    if product.save
      render json: product.as_json
    else
      render json: { errors: product.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    product = Product.find_by(id: params[:id])
    render json: product.as_json
  end

  def update
    product = Product.find_by(id: params[:id])
    product.name = params[:name] || product.name
    product.price = params[:price] || product.price
    product.in_stock = params[:in_stock] || product.in_stock
    product.description = params[:description] || product.description
    if product.save
      render json: product.as_json
    else
      render json: { errors: product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    product = Product.find_by(id: params[:id])
    product.destroy
    render json: { message: "Product has been removed." }
  end
end