class Page4slideController < ApplicationController
  def index
    @cart = currentCart
  end
end
