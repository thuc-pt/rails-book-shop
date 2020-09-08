class LinkSlidesController < ApplicationController
  before_action :set_link_slide, only: [:show, :edit, :update, :destroy]

  def index
    @cart = currentCart
    @link_slides = LinkSlide.all
  end

  def show
    @cart = currentCart
  end

  def new
    @cart = currentCart
    @link_slide = LinkSlide.new
  end

  def edit
    @cart = currentCart
  end

  def create
    @cart = currentCart
    @link_slide = LinkSlide.new(link_slide_params)

    respond_to do |format|
      if @link_slide.save
        format.html { redirect_to link_slides_path, notice: 'Link slide was successfully created.' }
        format.json { render :show, status: :created, location: @link_slide }
      else
        format.html { render :new }
        format.json { render json: @link_slide.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @cart = currentCart
    respond_to do |format|
      if @link_slide.update(link_slide_params)
        format.html { redirect_to link_slides_path, notice: 'Link slide was successfully updated.' }
        format.json { render :show, status: :ok, location: @link_slide }
      else
        format.html { render :edit }
        format.json { render json: @link_slide.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cart = currentCart
    @link_slide.destroy
    respond_to do |format|
      format.html { redirect_to link_slides_url, notice: 'Link slide was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_link_slide
      @link_slide = LinkSlide.find(params[:id])
    end

    def link_slide_params
      params.require(:link_slide).permit(:name)
    end
end