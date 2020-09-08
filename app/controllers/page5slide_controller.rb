class Page5slideController < ApplicationController
  def index
    @cart = currentCart
  end
end
