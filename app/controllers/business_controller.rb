class BusinessController < ApplicationController
  def index
    @cart = currentCart
    @business = Bookstore.joins(:book => [:category]).where("name='Kinh Doanh'").paginate(:page => params[:page], :per_page => 30)
  end
end