class BidsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:user_id])
    @auctions = @user.bids
  end

  def create
    @auction = Auction.find params[:auction_id]
    bid_params = params.require(:bid).permit(:price)
    @bid = Bid.new bid_params
    @bid.auction = @auction
    @bid.user = current_user

    if cannot? :bid, @auction
      redirect_to auction_path(@auction), alert: 'Cannot bid on your own auction! 😥'
      return
    end

    if @bid.save
      redirect_to auction_path(params[:auction_id])
    else
      render 'auctions/show'
    end

  end
end
