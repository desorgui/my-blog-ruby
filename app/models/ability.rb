class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, [Post, Comment, Like]

    return unless user.present? # additional permissions for logged in users (they can read their own posts)

    can :destroy, [Post, Comment, Like], author_id: user.id
    can :create, [Post, Comment, Like]
    can :update, [Post, Comment], author_id: user.id
    

    return unless user.admin? # additional permissions for administrators

    can :manage, :all
  end
end
