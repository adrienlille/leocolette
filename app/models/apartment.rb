class Apartment < ApplicationRecord
  belongs_to :user

  def own?
    self.user == user
  end
end
