class FavoritesController < ApplicationController
  before_action :authenticate_user!

  before_action :find_favorite, only: [:destroy]
  before_action :find_auction, only: [:create]

  def index
    @user = User.find params[:user_id]
    @auctions = @user.favorited_auctions
  end

  def create
    # if cannot? :favorite, @auction
    #   redirect_to auction_path(@auction), alert: 'Cannot favorite your own auction'
    #   return
    # end

    favorite = Favorite.new(user: current_user, auction: @auction)

    if favorite.save
      redirect_to auction_path(@auction)
    else
      redirect_to auction_path(@auction)
    end
  end

  def destroy

    if @favorite.destroy
      redirect_to auction_path(@favorite.auction)
      @favorite.destroy ? {notice: 'UnFavorite?'} : {alert: @favorite.errors.full_messages.join(', ') }
    end
  end


  private

  def find_favorite
    @favorite ||= Favorite.find params[:id]
  end

  def find_auction
    @auction ||= Auction.find params[:auction_id]
  end
end
