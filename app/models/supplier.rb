class Supplier < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

  has_many :products
  # def products
  #   Product.where(supplier_id: id)
  # end

  def as_json
    {
      id: id,
      name: name,
      email: email,
      phone_number: phone_number,
      # products: products.map { |product| product.name }
    }
  end
end
