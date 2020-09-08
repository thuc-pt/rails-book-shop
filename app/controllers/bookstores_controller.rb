class BookstoresController < ApplicationController
  before_action :set_bookstore, only: [:show, :edit, :update, :destroy]

  def index
    @cart = currentCart
    @bookstores = Bookstore.all.paginate(:page => params[:page], :per_page => 5)
  end

  def show
    @cart = currentCart
    @comment = Feedback.all.where("bookstore_id = '#{session[:bookstore_id]}'")
  end

  def new
    @cart = currentCart
    @bookstore = Bookstore.new
    @books = Book.find_by_sql('Select id, title from books where id not in (Select book_id from bookstores)')
  end

  def edit
    @cart = currentCart
    @books = Book.all
  end

  def create
    @cart = currentCart
    @bookstore = Bookstore.new(bookstore_params)

    respond_to do |format|
      if @bookstore.save
        format.html { redirect_to bookstores_path, notice: 'Bookstore was successfully created.' }
        format.json { render :show, status: :created, location: @bookstore }
      else
        format.html { render :new }
        format.json { render json: @bookstore.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @cart = currentCart
    respond_to do |format|
      if @bookstore.update(bookstore_params)
        format.html { redirect_to bookstores_path, notice: 'Bookstore was successfully updated.' }
        format.json { render :show, status: :ok, location: @bookstore }
      else
        format.html { render :edit }
        format.json { render json: @bookstore.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cart = currentCart
    @bookstore.destroy
    respond_to do |format|
      format.html { redirect_to bookstores_url, notice: 'Bookstore was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_bookstore
      @bookstore = Bookstore.find(params[:id])
      session[:bookstore_id] = @bookstore.id
    end

    def bookstore_params
      params.require(:bookstore).permit(:book_id, :quantity, :sold, :remain, :highlight, :sale, :price_sale)
    end
end