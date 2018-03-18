class Product < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :description, length: { in: 6..100 }

  def images
    Image.where(product_id: id)
  end

  def supplier
    Supplier.find_by(id: supplier_id)
  end

  def is_discounted
    price <= 20
  end

  def tax
    (price * 0.09).round(2)
  end

  def total
    price + tax
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
      is_discounted: is_discounted,
      supplier: supplier.as_json
      images: images.map { |image| image.url }
    }
  end
end
