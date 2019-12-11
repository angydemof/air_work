class DashboardController < ApplicationController
  def index
    @bookings = current_user.bookings
    @offices = current_user.offices
  end
end
