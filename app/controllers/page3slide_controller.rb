class Page3slideController < ApplicationController
  def index
    @cart = currentCart
  end
end
