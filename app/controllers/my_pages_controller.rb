class MyPagesController < ApplicationController
  before_action :require_login
  before_action :set_user

  def show
    @angry_cards = current_user.angry_cards.order(updated_at: :desc).page(params[:page]).per(12)
  end

  private

  def set_user
    @user = User.find(current_user.id)
  end
end
