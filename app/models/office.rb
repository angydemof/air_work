class Office < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings, dependent: :destroy
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  monetize :price_cents

  scope :price_desc, -> { order(price: :desc) }
  scope :price_asc, -> { order(price: :asc) }

  scope :filter_by_location, ->(location) { location.present? ? where("address ILIKE ?", "%#{location}%") : all }

  scope :filter_by_date, ->(date) { date.present? ? joins(:bookings).where("bookings.start_date < ? AND bookings.end_date > ?", date, date) : all }
  scope :filter_by_capacity, ->(capacity) { capacity.present? ? where(" capacity > ?", capacity) : all }
  has_many :schedules
  mount_uploader :photo, PhotoUploader
end
