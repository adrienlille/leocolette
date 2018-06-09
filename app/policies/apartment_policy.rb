class ApartmentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all

      # For a multi-tenant SaaS app, you may want to use:
      # scope.where(user: user)
    end
  end

  def create?
    true
  end

  def index?
    true
  end

  def show?
    true
  end
end
