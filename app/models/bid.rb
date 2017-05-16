class Bid < ApplicationRecord
  belongs_to :auction
  belongs_to :user
  validates :auction_id, presence: true
  validates :price, presence: true
  validate :amount_greater

  def amount_greater

    if price.present? &&
        auction.present? &&
        price <= auction.current_price
      errors.add(:price, "must be greater than the auction's current price")
    end
  end

  after_commit do
    auction.update_attribute(:current_price, self.price)
    if(self.price > auction.reserve)
      auction.update_attribute(:aasm_state, 'reserve_met')
    end
  end

end
