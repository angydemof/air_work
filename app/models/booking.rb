class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :office
  has_many :reviews
  monetize :amount_cents
end
