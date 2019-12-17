class Office < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings, dependent: :destroy
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  monetize :price_cents
  scope :filter_by_location, ->(location) { location.present? ? where("address ILIKE ?", "%#{location}%") : all }
  scope :filter_by_price, ->(price) { price.present? ? where("price_cents < ?", price.to_i * 100) : all }
  scope :filter_by_start_date, ->(date) { date.present? ? joins(:bookings).where("bookings.start_date < ? AND bookings.end_date > ?", date) : all }
  scope :filter_by_end_date, ->(date) { date.present? ? joins(:bookings).where("bookings.end_date > ?", date) : all }
  has_many :schedules
  mount_uploader :photo, PhotoUploader
end
