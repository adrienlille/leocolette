class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def create?
    user.bookings.where(apartment: record.apartment).count { |booking| booking.status == "approved" } > 0
  end
end
