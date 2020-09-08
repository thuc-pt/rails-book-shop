class SlidesController < ApplicationController
  before_action :set_slide, only: [:show, :edit, :update, :destroy]

  def index
    @cart = currentCart
    @slides = Slide.all.order('created_at DESC').paginate(:page => params[:page], :per_page => 8)
  end

  def show
    @cart = currentCart
  end

  def new
    @cart = currentCart
    @slide = Slide.new
    @link = LinkSlide.all
  end

  def edit
    @cart = currentCart
    @link = LinkSlide.all
  end

  def create
    @cart = currentCart
    @slide = Slide.new(slide_params)

    respond_to do |format|
      if @slide.save
        format.html { redirect_to slides_path, notice: 'Slide was successfully created.' }
        format.json { render :show, status: :created, location: @slide }
      else
        format.html { render :new }
        format.json { render json: @slide.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @cart = currentCart
    respond_to do |format|
      if @slide.update(slide_params)
        format.html { redirect_to slides_path, notice: 'Slide was successfully updated.' }
        format.json { render :show, status: :ok, location: @slide }
      else
        format.html { render :edit }
        format.json { render json: @slide.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cart = currentCart
    @slide.destroy
    respond_to do |format|
      format.html { redirect_to slides_url, notice: 'Slide was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_slide
      @slide = Slide.find(params[:id])
    end

    def slide_params
      params.require(:slide).permit(:url_img, :link_slide_id)
    end
end