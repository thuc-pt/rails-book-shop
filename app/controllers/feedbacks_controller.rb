class FeedbacksController < ApplicationController
  before_action :set_feedback, only: [:show, :edit, :update, :destroy]

  def index
    @cart = currentCart
    @feedbacks = Feedback.all.where("account_id = '#{session[:account_id]}'")
  end

  def show
    @cart = currentCart
  end

  def new
    @cart = currentCart
    @feedback = Feedback.new
  end

  def edit
    @cart = currentCart
  end

  def create
    @cart = currentCart
    @feedback = Feedback.new(feedback_params_new)

    respond_to do |format|
      if @feedback.save
        format.html { redirect_to feedbacks_path, notice: 'Đã lưu nhận xét của bạn' }
        format.json { render :show, status: :created, location: @feedback }
      else
        format.html { render :new }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @cart = currentCart
    respond_to do |format|
      if @feedback.update(feedback_params_edit)
        format.html { redirect_to feedbacks_path, notice: 'Sửa nhận xét thành công.' }
        format.json { render :show, status: :ok, location: @feedback }
      else
        format.html { render :edit }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cart = currentCart
    @feedback.destroy
    respond_to do |format|
      format.html { redirect_to feedbacks_url, notice: 'Đã xóa!' }
      format.json { head :no_content }
    end
  end

  private
    def set_feedback
      @feedback = Feedback.find(params[:id])
    end

    def feedback_params_new
      params.permit(:account_id, :bookstore_id, :start, :title, :content)
    end

    def feedback_params_edit
      params.require(:feedback).permit(:account_id, :bookstore_id, :start, :title, :content)
    end
end
