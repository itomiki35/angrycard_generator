class MyPagesController < ApplicationController
  before_action :require_login
  before_action :set_user
  before_action :guest_check

  def edit; end

  def update
    if @user.update(user_params)
      redirect_to my_page_path, success: t('defaults.message.updated')
    else
      flash.now['danger'] = t('defaults.message.not_updated')
      render :edit
    end
  end

  def show
    @angry_cards = current_user.angry_cards.order(updated_at: :desc).page(params[:page]).per(12)
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end

  def guest_check
    if current_user.guest?
      redirect_to root_path,notice: "このページを見るには会員登録が必要です。"
    end
  end

  def user_params
    params.require(:user).permit(:email, :name, :avatar, :avatar_cache)
  end
end
