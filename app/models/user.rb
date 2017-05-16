class User < ApplicationRecord
  has_secure_password
  before_validation :downcase_email

  has_many :auctions, dependent: :destroy
  has_many :bids, dependent: :destroy

  has_many :favorites, dependent: :destroy
  has_many :favorited_auctions, through: :favorites, source: :auction

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: VALID_EMAIL_REGEX
  validates :first_name, presence: true
  validates :last_name, presence: true

  private

  def downcase_email
    self.email&.downcase!
  end
end
