class MyPagesController < ApplicationController
  before_action :require_login
  before_action :set_user
  before_action :guest_check

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
end
