class Office < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings, dependent: :destroy
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  monetize :price_cents

  scope :filter_by_location, ->(location) { location.present? ? where("address ILIKE ?", "%#{location}%") : all }

  scope :filter_by_date, ->(date) { date.present? ? left_joins(:bookings).where("bookings.start_date < ? OR bookings.end_date > ?", date, date) : all }
  scope :filter_by_capacity, ->(capacity) { capacity.present? ? where(" capacity >= ?", capacity) : all }
  has_many :schedules
  mount_uploader :photo, PhotoUploader
end
