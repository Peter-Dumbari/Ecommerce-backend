class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # Guest user

    can :read, Product

    if user.persisted?
      can :manage, Order, user_id: user.id
      can :read, Order, user_id: user.id
      can :create, Order
      can :destroy, Order, user_id: user.id, state: 'draft'
    end

    return unless user.admin?

    can :manage, :all
  end
end
