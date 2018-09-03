class MessagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.profile.account_type == 1
        user.bookings.messages
      else
        user.apartments.each { |apartment| apartment.bookings.each { |booking| booking.messages } }
      end
    end
  end

  def index?
    true
  end
end
