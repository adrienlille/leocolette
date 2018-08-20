class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def new?
      user.account_type == 1
    end

    def create?
      user.account_type == 1
    end

    def show?
      user.account_type == (1 || 2)
    end
end
