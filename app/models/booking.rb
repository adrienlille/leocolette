class Booking < ApplicationRecord
  has_one :apartment
  belongs_to :user
end
