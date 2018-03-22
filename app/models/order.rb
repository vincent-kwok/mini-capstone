class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product

  # def subtotal
  #   product_id.price * quantity
  # end

  # def total_tax
  #   (subtotal * 0.09).round(2)
  # end

  # def grand_total
  #   subtotal + total_tax
  # end

  # def as_json
  #   {
  #     product_id: product_id,
  #     quantity: quantity,
  #     subtotal: subtotal,
  #     total_tax: total_tax,
  #     grand_total: grand_total
  #   }
  # end
end