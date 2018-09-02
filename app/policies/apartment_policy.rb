class ApartmentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all

      # For a multi-tenant SaaS app, you may want to use:
      # scope.where(user: user)
    end
  end

  def create?
    account_type_is_set? and user.profile.account_type == 2
  end

  def new?
    create?
  end

  def index?
    true
  end

  def show?
    true
  end

  def mine?
    true
  end

  def edit?
    record.user == user
  end

  def update?
    edit?
  end

  private

  def account_type_is_set?
    user.profile and user.profile.account_type
  end
end
