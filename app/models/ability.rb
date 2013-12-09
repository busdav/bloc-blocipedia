class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.role? :free
      can :manage, Wiki, public: true
      cannot :manage, Wiki, public: false
      cannot :read, Wiki, public: false
    end

    if user.role? :premium
      can :manage, Wiki.where(public:false && Wiki.user == user.id
      can :manage, Wiki.where(public: false) do |w|
        w.collaborators.map(&:user_id).include(user.id)
      end
    end

    can :read, Wiki, public: true 
    #cannot :read, Wiki, public: false

  end
end