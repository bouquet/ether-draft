class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
      can :manage, :all
    elsif user.confirmed?
      can :create, Post, :group_id => user.group_ids
      can :update, Post, :user_id => user.id
      can :join, Group do |group|
        !group.users.include? user
      end
      can :read, [Group, Post, User]
      can :create, Reply
    else
      can :read, :all
      cannot [:create, :update], Group
    end
  end
end
