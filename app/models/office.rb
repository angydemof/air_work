class Office < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings, dependent: :destroy
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  monetize :price_cents

  scope :filter_by_location, ->(location) { location.present? ? where("address ILIKE ?", "%#{location}%") : all }

  scope :start_date_between, ->(start_date, end_date) { start_date.present? && end_date.present? ? left_joins(:bookings).where.not("bookings.start_date BETWEEN ? AND ?", start_date, end_date) : all }

  scope :end_date_between, ->(start_date, end_date) { start_date.present? && end_date.present? ? left_joins(:bookings).where.not("bookings.end_date BETWEEN ? AND ?", start_date, end_date) : all }

  scope :start_and_end_date, ->(start_date, end_date) { start_date.present? && end_date.present? ? left_joins(:bookings).where.not("bookings.start_date < ? AND bookings.end_date > ?", start_date, end_date) : all }

  scope :filter_by_date, ->(start_date, end_date) {
    start_date_between(start_date, end_date).or(end_date_between(start_date, end_date)).or(start_and_end_date(start_date, end_date))
  }

  scope :filter_by_capacity, ->(capacity) { capacity.present? ? where(" capacity >= ?", capacity) : all }
  has_many :schedules
  mount_uploader :photo, PhotoUploader
end
