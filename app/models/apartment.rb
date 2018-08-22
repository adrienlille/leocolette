class Apartment < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_many :bookings

  def own?
    self.user == user
  end
end
