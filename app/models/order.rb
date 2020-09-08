class Order < ApplicationRecord
  # has_many :items, :dependent => :destroy
  belongs_to :cart
  PAYMENT_TYPES = ['Tiền mặt', 'ATM']
  validates :name, :address, :email, :pay_type, :presence => true
  validates :pay_type, :inclusion => PAYMENT_TYPES

  def add_items_from_cart(cart)
    cart.items.each do |item|
      item.cart_id = nil
      # items << item
    end
  end
end