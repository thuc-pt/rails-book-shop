class AdminController < ApplicationController
  def index
    @cart = currentCart
    @user = User.all.where("account_id = #{session[:account_id]}")
  end
end