class User < ApplicationRecord
  validates :email, format: /@gmail/
  belongs_to :account
end