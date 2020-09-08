class ComputerScienceController < ApplicationController
  def index
    @cart = currentCart
    @computerScience = Bookstore.joins(:book => [:category]).where("name='Khoa Học Máy Tính'").paginate(:page => params[:page], :per_page => 30)
  end
end