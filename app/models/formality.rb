class Formality < ApplicationRecord
  has_many :books, :dependent => :destroy
end