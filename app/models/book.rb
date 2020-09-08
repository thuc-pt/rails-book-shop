class Book < ApplicationRecord
  validates :url_img, :category_id, :company_id, :supplier_id, :formality_id, :language_id, :presence => true
  belongs_to :category
  belongs_to :supplier
  belongs_to :company
  belongs_to :formality
  belongs_to :language
  has_one :bookstore, :dependent => :destroy
  mount_uploader :url_img,UrlImgUploader
end