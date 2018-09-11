class Apartment < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  belongs_to :user
  has_many :bookings
  has_many :reviews

  def own?
    self.user == user
  end

  def score
    self.reviews.average(:score).round
  end

  def stars
    stars = ''
    stars << '<li><i class="fa fa-star" aria-hidden="true"></i></li>' * self.score
    stars << '<li><i class="fa fa-star-o" aria-hidden="true"></i></li>' * (5 - self.score)
    return stars
  end
end
