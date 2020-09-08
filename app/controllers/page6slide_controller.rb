class Page6slideController < ApplicationController
  def index
    @cart = currentCart
  end
end
