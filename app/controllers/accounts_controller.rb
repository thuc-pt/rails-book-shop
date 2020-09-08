class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :edit, :update, :destroy]

  def index
    @cart = currentCart
    @accounts = Account.all.paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @cart = currentCart
  end

  def new
    @cart = currentCart
    @account = Account.new
  end

  def edit
    @cart = currentCart
  end

  def create
    @cart = currentCart
    @account = Account.new(account_params)

    respond_to do |format|
      if @account.save
        if @account.admin == 1
          format.html { redirect_to login_path, notice: 'Tạo tài khoản thành công!' }
        else
          format.html { redirect_to login_path, notice: 'Tạo tài khoản thành công!' }
        end
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :new }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @cart = currentCart
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to root_path, notice: 'Cập nhật thành công!' }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cart = currentCart
    @account.destroy
    respond_to do |format|
      format.html { redirect_to accounts_url, notice: 'Account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_account
      @account = Account.find(params[:id])
    end

    def account_params
      params.require(:account).permit(:username, :hash_password, :salt, :password, :passwordConfirmation)
    end
end