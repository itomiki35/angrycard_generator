class UserSessionsController < ApplicationController

  def new; end
  
  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_to root_path, success: t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :new
    end
  end
  
  def destroy
    logout
    #flash[:success] = t('.success')
    redirect_to root_path, success: t('.success')
  end

  def guest_login
    redirect_to root_path, alert: 'すでにログインしています' if current_user

    random_value = SecureRandom.hex
    guest = User.create!(name: 'ゲスト', email: "guest_#{random_value}@example.com", password: "#{random_value}", password_confirmation: "#{random_value}", guest: true)
    auto_login(guest)
    redirect_to new_angry_card_path, success: 'ゲストユーザーとしてログインしました'
  end
end
