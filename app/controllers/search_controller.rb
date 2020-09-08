class SearchController < ApplicationController
  def index
    @cart = currentCart
    if params[:info].empty?
      redirect_to root_path
    else
      @book = Bookstore.joins(:book).where("title like '%#{params[:info]}%' or author like '%#{params[:info]}%'")
    end
  end
  def book_params
    params.require(:search).permit(:info)
  end
end