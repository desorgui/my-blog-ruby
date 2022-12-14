class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present? # additional permissions for logged in users (they can read their own posts)

    can :destroy, [Post, Comment], author_id: user.id

    return unless user.admin? # additional permissions for administrators

    can :manage, :all
  end
end
