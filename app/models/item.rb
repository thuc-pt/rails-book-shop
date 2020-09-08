class Item < ApplicationRecord
  belongs_to :bookstore
  belongs_to :cart
  # belongs_to :order
  def totalPrice
    bookstore.book.price * quantity
  end
end