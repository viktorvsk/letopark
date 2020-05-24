# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    case user.role
    when 'merchant'
      can :manage, OrderItem, store_id: user.stores.pluck(:id)
    when 'waiter'
      can :manage, Order
    when 'admin'
      can :manage, :all
    else
      raise
    end
  end
end
