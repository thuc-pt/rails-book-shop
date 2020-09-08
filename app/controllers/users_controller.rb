class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
    @cart = currentCart
    @users = User.all.paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @cart = currentCart
  end

  def new
    @cart = currentCart
    @user = User.new
  end

  def edit
    @cart = currentCart
  end

  def create
    @cart = currentCart
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        if session[:account_role]
          format.html { redirect_to admin_path, notice: 'Cập nhật thông tin thành công!' }
        else
          format.html { redirect_to customer_path, notice: 'Cập nhật thông tin thành công!' }
        end
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @cart = currentCart
    respond_to do |format|
      if @user.update(user_params)
        if session[:account_role]
          format.html { redirect_to admin_path, notice: 'Chỉnh sửa thông tin thành công!' }
        else
          format.html { redirect_to customer_path, notice: 'Chỉnh sửa thông tin thành công!' }
        end
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cart = currentCart
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:fullname, :phone, :email, :address, :birthday, :gender, :account_id)
    end
end