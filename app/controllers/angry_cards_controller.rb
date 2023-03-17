class AngryCardsController < ApplicationController
  def index
    @angry_cards = AngryCard.all.includes(:user).order(created_at: :desc)
  end

  def new
    @angry_card = AngryCard.new
  end

  def create
    @angry_card = current_user.angry_cards.new(angry_card_params)
      @angry_card.create_image
      @angry_card.generate_image
      #binding.pry
      if @angry_card.save
      
      # @angry_card.generate_image

       #@angry_card.save
       # トランザクション

        redirect_to angry_card_path(@angry_card.id)
      else
        render :new
      end
  end

  def show
    @angry_card = AngryCard.find(params[:id])
  end

  def destroy
    @angry_card = AngryCard.find(params[:id])
    @angry_card.destroy
    redirect_to angry_cards_path
  end


  private

  def angry_card_params
    params.require(:angry_card).permit(:title, :body)
  end

end
