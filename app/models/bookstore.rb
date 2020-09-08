class Bookstore < ApplicationRecord
  belongs_to :book
  has_many :items
  has_many :feedbacks
  before_destroy :checkItem
  private
  def checkItem
    if items.empty?
      return true
    else
      errors.add(:base, 'Không thể xóa sản phẩm này!')
      return false
    end
  end
end