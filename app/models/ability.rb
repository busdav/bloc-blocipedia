class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
      if user.role? :premium
        can :manage, :all
      end
    
    if user.role? :free
        can :read, Wiki, public: true
        can :manage, Wiki, public: true
        cannot :manage, Wiki, public: false
      end
      can :read, :all, public: true
  end
end
