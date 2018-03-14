class Product < ApplicationRecord
  def is_discounted
    price.to_i <= 20
  end

  def tax
    (price.to_i * 0.09).round(2)
  end

  def total
    price.to_i + tax
  end

  def as_json
    {
      id: id,
      name: name,
      price: price,
      in_stock: in_stock,
      image_url: image_url,
      description: description,
      tax: tax,
      total: total,
      is_discounted: is_discounted
    }
  end
end
