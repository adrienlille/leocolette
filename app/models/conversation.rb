class Conversation < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :apartment
  belongs_to :user1, foreign_key: :user1_id, class_name: "User"
  belongs_to :user2, foreign_key: :user2_id, class_name: "User"

  validates :user1, uniqueness: { scope: [:user2_id, :apartment_id] }
  validates :user2, uniqueness: { scope: [:user1_id, :apartment_id] }

  scope :between, -> (user1_id, user2_id, apartment_id) do
    where(user1_id: user1_id, user2_id: user2_id, apartment_id: apartment_id).or(
      where(user1_id: user2_id, user2_id: user1_id, apartment_id: apartment_id)
    )
  end
end
