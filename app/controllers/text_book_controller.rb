class TextBookController < ApplicationController
  def index
    @cart = currentCart
    @textBook = Bookstore.joins(:book => [:category]).where("name='Giáo Trình Và Sách Tham Khảo'").paginate(:page => params[:page], :per_page => 30)
  end
end
