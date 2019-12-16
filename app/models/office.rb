class Office < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings, dependent: :destroy
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  monetize :price_cents
  scope :filter_by_location, ->(location) { location.present? ? where("address ILIKE ?", "%#{location}%") : all }
  scope :filter_by_price, ->(price) { price.present? ? where("price_cents < ?", price.to_i * 100) : all }
  scope :filter_by_date, ->(date) { date.present? ? offices.joins(:bookings).where.not(bookings: { start_date: date }) : all }
end
