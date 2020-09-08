class StoryPictureController < ApplicationController
  def index
    @cart = currentCart
    @storyPicture = Bookstore.joins(:book => [:category]).where("name='Truyện Tranh'").paginate(:page => params[:page], :per_page => 30)
  end
end
