class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @cart = currentCart
    @items = Item.all.paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @cart = currentCart
  end

  def new
    @cart = currentCart
    @item = Item.new
  end

  def edit
    @cart = currentCart
  end

  def create
    @cart = currentCart
    book = Bookstore.find(params[:bookstore_id])
    @item = @cart.addBook(book.id)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item.cart, notice: 'Đã thêm vào giỏ hàng!' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @cart = currentCart
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cart = currentCart
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:bookstore_id, :cart_id, :quantity)
    end
end