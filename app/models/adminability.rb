class AdminAbility
  include CanCan::Ability
  
  def initialize(admin)
    if admin.role? :super_admin
      can :manage, :all
    elsif admin.role? :admin
      can :manage, :all
    end
  end


end

