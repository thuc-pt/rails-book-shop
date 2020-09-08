class Cart < ApplicationRecord
  has_many :items, :dependent => :destroy
  has_many :orders
  def addBook(bookstore_id)
    currentItem = items.find_by_bookstore_id(bookstore_id)
    if currentItem
      currentItem.quantity += 1
    else
      currentItem = items.build(:bookstore_id => bookstore_id)
    end
    currentItem
  end
  def totalPrice
    items.to_a.sum{|cart| cart.totalPrice}
  end
end