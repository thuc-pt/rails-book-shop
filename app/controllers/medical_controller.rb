class MedicalController < ApplicationController
  def index
    @cart = currentCart
    @medical = Bookstore.joins(:book => [:category]).where("name='Y Khoa'").paginate(:page => params[:page], :per_page => 30)
  end
end