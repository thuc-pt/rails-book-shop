class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]

  def index
    @cart = currentCart
    @books = Book.all.paginate(:page => params[:page], :per_page => 5)
  end

  def show
    @cart = currentCart
  end

  def new
    @cart = currentCart
    @book = Book.new
    @categories = Category.all
    @suppliers = Supplier.all
    @companies = Company.all
    @formalities = Formality.all
    @languages = Language.all
  end

  def edit
    @cart = currentCart
    @categories = Category.all
    @suppliers = Supplier.all
    @companies = Company.all
    @formalities = Formality.all
    @languages = Language.all
  end

  def create
    @cart = currentCart
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @cart = currentCart
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cart = currentCart
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:url_img, :title, :author, :price, :detail, :publishing_date, :weight, :size, :number_page, :sku, :category_id, :supplier_id, :company_id, :formality_id, :language_id)
    end
end