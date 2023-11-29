

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.hr?
      can [:create, :update, :destroy, :index], Employee
    elsif user.manager?
      can :manage, Meet
      can :update_password, Employee
      can :created_meetings, Employee
      can :subordinates, Employee
  
    else
      can :read, Meet
      can :update_password, Employee
      can :participated_meetings, Employee
      can :manager, Employee
    end
   
  end




end
