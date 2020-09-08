class ScienceFictionController < ApplicationController
  def index
    @cart = currentCart
    @scienceFiction = Bookstore.joins(:book => [:category]).where("name='Khoa Học Viễn Tưởng'").paginate(:page => params[:page], :per_page => 30)
  end
end
