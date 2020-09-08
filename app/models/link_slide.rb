class LinkSlide < ApplicationRecord
  has_many :slides, :dependent => :destroy
end