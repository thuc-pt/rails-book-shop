class Page7slideController < ApplicationController
  def index
    @cart = currentCart
  end
end
