class Page2slideController < ApplicationController
  def index
    @cart = currentCart
  end
end
