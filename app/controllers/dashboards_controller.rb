class DashboardsController < ApplicationController
  def index
    @bookings = current_user.bookings
    @bookings.each { |booking| @booking = booking }
    @offices = current_user.offices
    @bookings_received = []
    @offices.each do |office|
      @office = office
      @office.bookings.each do |booking|
        @bookings_received << booking
      end
    end
  end
end
