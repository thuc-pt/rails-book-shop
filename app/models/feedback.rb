class Feedback < ApplicationRecord
  belongs_to :account
  belongs_to :bookstore
  validates :account_id, :bookstore_id, :title, :content, :start, :presence => true
end