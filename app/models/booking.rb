class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :office
  belongs_to :review
end
