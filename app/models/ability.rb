class Ability
  include CanCan::Ability

  def initialize(user)
    
    user ||= User.new

    can :bid, Auction do |a|
      a.user != user
    end
  end
end
