class SuppliersController < ApplicationController
  before_action :set_supplier, only: [:edit, :update, :destroy]

  def index
    @cart = currentCart
    @suppliers = Supplier.all.paginate(:page => params[:page], :per_page => 5)
  end

  def show
    @cart = currentCart
  end

  def new
    @cart = currentCart
    @supplier = Supplier.new
  end

  def edit
    @cart = currentCart
  end

  def create
    @cart = currentCart
    @supplier = Supplier.new(supplier_params)

    respond_to do |format|
      if @supplier.save
        format.html { redirect_to suppliers_path, notice: 'Supplier was successfully created.' }
        format.json { render :show, status: :created, location: @supplier }
      else
        format.html { render :new }
        format.json { render json: @supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @cart = currentCart
    respond_to do |format|
      if @supplier.update(supplier_params)
        format.html { redirect_to suppliers_path, notice: 'Supplier was successfully updated.' }
        format.json { render :show, status: :ok, location: @supplier }
      else
        format.html { render :edit }
        format.json { render json: @supplier.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cart = currentCart
    @supplier.destroy
    respond_to do |format|
      format.html { redirect_to suppliers_url, notice: 'Supplier was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_supplier
      @supplier = Supplier.find(params[:id])
    end

    def supplier_params
      params.require(:supplier).permit(:name)
    end
end