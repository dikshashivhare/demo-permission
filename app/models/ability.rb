# frozen_string_literal: true

class Ability
  include CanCan::Ability

  
  def initialize(user)
     user ||= User.new # guest user (not logged in)
    #Admin
    if user.admin?
      can :manage, :all
    # employee
    elsif user.employee?
      can :read, :index
      cannot :read, :contact
    #Manager
    elsif user.manager?
      can :read, :about
      can :read, :contact
      cannot :read, :index
    else
      can :read, :all
    end
  end
end

#can :read, :index if user.has_attribute? :admin



