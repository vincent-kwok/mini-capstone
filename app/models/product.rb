class Product < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :description, length: { in: 6..100 }

  has_many :carted_products
  has_many :orders, through: :carted_products
  belongs_to :supplier
  # def supplier
  #   Supplier.find_by(id: supplier_id)
  # end

  has_many :images
  # def images
  #   Image.where(product_id: id)
  # end
  has_many :orders
  has_many :category_products
  has_many :categories, through: :category_products

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
      description: description,
      price: price,
      tax: tax,
      total: total,
      is_discounted: is_discounted,
      supplier: supplier.as_json,
      images: images.map { |image| image.url },
      categories: categories.map { |category| category.name }
    }
  end
end