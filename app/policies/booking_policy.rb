class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def new?
    create?
  end

  def create?
    user.profile.account_type == 1
  end

  def show?
    user.profile.account_type == (1 || 2)
  end
end
