class AdminAbility
  include CanCan::Ability
  
  def initialize(admin)
    if admin.usertype? :super_admin
      can :manage, :all
      can :read, User
    elsif admin.usertype? :admin
      can :read, :all
    end
  end


end

