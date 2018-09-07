class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.profile.account_type == 1
        scope.where(user: user)
      else
        scope.where(apartment: user.apartments)
      end
    end
  end

  def index?
    true
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
