class ProfilePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def setaccount?
    true
  end

  def saveaccounttype?
    user.profile.account_type.nil?
  end

  def edit?
    record.user == user
  end

  def update?
    edit?
  end

  def show?
    true
  end
end
