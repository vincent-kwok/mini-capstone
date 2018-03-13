class Product < ApplicationRecord
  def is_discounted
    price.to_i <= 20
  end

  def tax
    price.to_i * 0.09
  end

  def total
    price.to_i + tax
  end

  def as_json
    {
      id: id,
      name: name,
      price: price,
      image_url: image_url,
      description: description,
      tax: tax,
      total: total,
      is_discounted: is_discounted
    }
  end
end
