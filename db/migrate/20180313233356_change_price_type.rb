class ChangePriceType < ActiveRecord::Migration[5.1]
  def change
    change_column :products, :price, :decimal, precision: 9, scale: 2
  end
end
