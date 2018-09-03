class Booking < ApplicationRecord
  has_one :apartment
  has_many :messages
end
