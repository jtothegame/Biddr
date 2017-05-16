class AuctionsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_auction, only: [:show]

  def index
    @auctions = Auction.order(created_at: :DESC)
  end

  def new
    @auction = Auction.new
  end

  def show
    @bid = Bid.new
  end

  def create
    @auction = Auction.new auction_params
    @auction.user = current_user
    if @auction.save
      redirect_to auction_path(@auction)
    else
      render :new
    end
  end

  private

  def find_auction
    @auction = Auction.find params[:id]
  end

  def auction_params
    params.require(:auction).permit(:title, :description, :ends_on, :reserve)
  end
end
