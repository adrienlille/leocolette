class MessagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.bookings
    end
  end

  def index?
    true
  end
end
