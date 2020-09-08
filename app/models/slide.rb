class Slide < ApplicationRecord
  validates :url_img, :presence => true
  belongs_to :link_slide
  mount_uploader :url_img, ImgSlideUploader
end