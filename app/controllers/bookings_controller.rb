class BookingsController < ApplicationController
  before_action :find_booking, only: %i[show accept reject]

  def index
    @bookings = Booking.all
  end

  def show
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(set_booking_params)
    @office = Office.find(params[:office_id])
    @booking.office = @office
    @booking.user = current_user

    if @booking.save
      redirect_to dashboards_path
    else
      render :new
    end
  end

  def accept
    @booking.update(status: 'Accepted')
    redirect_to dashboards_path
  end

  def reject
    @booking.update(status: 'Rejected')
    redirect_to dashboards_path
  end

  private

  def find_booking
    @booking = Booking.find(params[:id])
  end

  def set_booking_params
    params.require(:booking).permit(:start_date, :end_date, :number_of_people)
  end
end
