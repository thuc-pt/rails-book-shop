class CookingController < ApplicationController
  def index
    @cart = currentCart
    @cooking = Bookstore.joins(:book => [:category]).where("name='Nấu Ăn'").paginate(:page => params[:page], :per_page => 30)
  end
end
