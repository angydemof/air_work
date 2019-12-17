class DashboardsController < ApplicationController
  def index
    @bookings = current_user.bookings.order(created_at: :desc)
    @offices = current_user.offices.order(created_at: :desc)
    @bookings_received = []
    @offices.each do |office|
      office.bookings.each do |booking|
        @bookings_received << booking
      end
    end
    @bookings_received.sort_by(&:created_at).reverse
  end
end
