class FormalitiesController < ApplicationController
  before_action :set_formality, only: [:edit, :update, :destroy]

  def index
    @cart = currentCart
    @formalities = Formality.all.paginate(:page => params[:page], :per_page => 5)
  end

  def show
    @cart = currentCart
  end

  def new
    @cart = currentCart
    @formality = Formality.new
  end

  def edit
    @cart = currentCart
  end

  def create
    @cart = currentCart
    @formality = Formality.new(formality_params)

    respond_to do |format|
      if @formality.save
        format.html { redirect_to formalities_path, notice: 'Formality was successfully created.' }
        format.json { render :show, status: :created, location: @formality }
      else
        format.html { render :new }
        format.json { render json: @formality.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @cart = currentCart
    respond_to do |format|
      if @formality.update(formality_params)
        format.html { redirect_to formalities_path, notice: 'Formality was successfully updated.' }
        format.json { render :show, status: :ok, location: @formality }
      else
        format.html { render :edit }
        format.json { render json: @formality.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cart = currentCart
    @formality.destroy
    respond_to do |format|
      format.html { redirect_to formalities_url, notice: 'Formality was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_formality
      @formality = Formality.find(params[:id])
    end

    def formality_params
      params.require(:formality).permit(:name)
    end
end