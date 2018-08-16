class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def new?
      user.profile_type == 1
    end

    def create?
      user.profile_type == 1
    end

    def show?
      user.profile_type == (1 || 2)
    end
end
