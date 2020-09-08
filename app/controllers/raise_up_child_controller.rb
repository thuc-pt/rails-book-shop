class RaiseUpChildController < ApplicationController
  def index
    @cart = currentCart
    @raiseUpChild = Bookstore.joins(:book => [:category]).where("name='Nuôi Dạy Con'").paginate(:page => params[:page], :per_page => 30)
  end
end
