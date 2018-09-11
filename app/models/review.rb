class Review < ApplicationRecord
  belongs_to :apartment
  belongs_to :user
end
