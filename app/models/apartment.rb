class Apartment < ApplicationRecord
  belongs_to :user
  has_many :bookings

  def own?
    self.user == user
  end
end
