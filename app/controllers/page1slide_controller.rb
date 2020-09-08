class Page1slideController < ApplicationController
  def index
    @cart = currentCart
  end
end
