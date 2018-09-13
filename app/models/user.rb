class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :apartments, dependent: :destroy
  has_one :profile, dependent: :destroy
  has_many :bookings
  has_many :orders

  def student?
    self.profile.account_type == "1"
  end

end
