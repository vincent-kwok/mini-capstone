class V1::OrdersController < ApplicationController
  before_action :authenticate_user

  def index
    orders = current_user.orders
    render json: orders
  end

  def create
    carted_products = current_user.carted_products.where(status: "carted")

    calculated_subtotal = 0
    carted_products.each { |carted_product|
      calculated_subtotal += carted_product.product.price * carted_product.quantity
    }
    calculated_tax = calculated_subtotal * 0.09
    calculated_total = calculated_tax + calculated_subtotal

    order = Order.new(
    user_id: current_user.id,
    # product_id: params[:product_id],
    # quantity: params[:quantity],
    subtotal: calculated_subtotal,
    tax: calculated_tax,
    total: calculated_total
    )
    order.save
    
    carted_products.each { |carted_product|
      carted_product.status = "purchased"
      carted_product.order_id = order.id
      carted_product.save
    }
    render json: order.as_json

    # product = Product.find_by(id: params[:product_id])
  end
end