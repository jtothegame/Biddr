class Auction < ApplicationRecord

  has_many :favorites, dependent: :destroy
  has_many :favorited, through: :favorites, source: :user

  has_many :bids, dependent: :destroy
  belongs_to :user

  validates :title, :description, :ends_on, :reserve, presence: true


  def favorited_by?(user)
    favorites.exists?(user: user)
  end

  def favorite_for(user)
    favorites.find_by(user: user)
  end


  include AASM

  aasm whiny_transitions: false do
    state :draft, initial: true
    state :published, :canceled, :reserve_met, :reserve_not_met, :won

    event :published do
      transitions from: :draft, to: :published
    end


    event :reserve_not_met do
      transitions from: :published, to: :reserve_not_met
    end

    event :cancel do
      transitions from: :reserve_not_met, to: :canceled
    end

    event :reserve_met do
      transitions from: :published, to: :reserve_met
    end

    event :won do
      transitions from: :reserve_met, to: :won
    end
  end
end
