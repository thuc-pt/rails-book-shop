class Page8slideController < ApplicationController
  def index
    @cart = currentCart
  end
end
