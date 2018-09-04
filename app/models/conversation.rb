class Conversation < ApplicationRecord
  has_many :messages, dependent: :destroy
  belongs_to :apartment
  belongs_to :user1, foreign_key: :user1_id, class_name: "User"
  belongs_to :user2, foreign_key: :user2_id, class_name: "User"

  validates :user1, uniqueness: { scope: [:user2_id, :apartment_id] }
  validates :user2, uniqueness: { scope: [:user1_id, :apartment_id] }

  scope :between, -> (sender_id, recipient_id) do
    where(sender_id: sender_id, recipient_id: recipient_id).or(
      where(sender_id: recipient_id, recipient_id: sender_id)
    )
  end
end
