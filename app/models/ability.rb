class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.role? :free
      can :read, Wiki, public: true
    end

    if user.role? :premium
      can :manage, :all
    end
  
      can :read, Wiki, public: true

  end
end