class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create guest_login]

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
    @guest_user = User.new(
      name: 'ゲスト',
      email: 'guest_angrycard@example.com',
      password: 'password',
      password_confirmation: 'password',
      guest: true
    )
    unless @guest_user.save
      @guest_user = User.find_by(
        email: 'guest_angrycard@example.com'
      )
    end
    auto_login(@guest_user)
    redirect_to new_angry_card_path, success: 'ゲストとしてログインしました'
  end
end
