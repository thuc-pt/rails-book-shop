class LanguagesController < ApplicationController
  before_action :set_language, only: [:edit, :update, :destroy]

  def index
    @cart = currentCart
    @languages = Language.all.paginate(:page => params[:page], :per_page => 5)
  end

  def show
    @cart = currentCart
  end

  def new
    @cart = currentCart
    @language = Language.new
  end

  def edit
    @cart = currentCart
  end

  def create
    @cart = currentCart
    @language = Language.new(language_params)

    respond_to do |format|
      if @language.save
        format.html { redirect_to languages_path, notice: 'Language was successfully created.' }
        format.json { render :show, status: :created, location: @language }
      else
        format.html { render :new }
        format.json { render json: @language.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @cart = currentCart
    respond_to do |format|
      if @language.update(language_params)
        format.html { redirect_to languages_path, notice: 'Language was successfully updated.' }
        format.json { render :show, status: :ok, location: @language }
      else
        format.html { render :edit }
        format.json { render json: @language.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cart = currentCart
    @language.destroy
    respond_to do |format|
      format.html { redirect_to languages_url, notice: 'Language was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_language
      @language = Language.find(params[:id])
    end

    def language_params
      params.require(:language).permit(:name)
    end
end