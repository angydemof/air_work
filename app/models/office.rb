class Office < ApplicationRecord
  belongs_to :photo
  has_one :user
  has_many :bookings
  has_many :reviews, through: :bookings
end
