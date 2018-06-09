class Apartment < ApplicationRecord
  belongs_to :user
  attr_reader :name
end
