class MessagesController < ApplicationController

  def index
    @messages = policy_scope(Message)
  end
end

  private

  def fetch_messages
    messages = []
    if current_user.profile.account_type == 1
      current_user.bookings.each { |booking| messages << booking.messages.last }
    else
      current_user.apartments.each { |apartment| apartment.bookings.each { |booking| messages << booking.messages.last } }
    end
    if messages.any?
      return messages.map! { |message| authorize message }
    else
      return []
    end
  end
