class LoginsController < ApplicationController
  def new
    @cart = currentCart
  end

  def create
    if account = Account.authenticate(params[:username], params[:password])
      session[:account_id] = account.id
      session[:account_name] = account.username
      session[:account_role] = account.admin
      if account.admin?
        redirect_to admin_path
      else
        redirect_to customer_path
      end
    else
      redirect_to login_path, :alert => 'Tài khoản hoặc mật khẩu không chính xác, vui lòng thử lại!'
    end
  end

  def destroy
    session[:account_id] = nil
    session[:account_name] = nil
    session[:account_role] = nil
    redirect_to root_path
  end
end