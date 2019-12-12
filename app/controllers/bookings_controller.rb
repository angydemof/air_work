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
    office = Office.find(params[:office_id])
    booking = Booking.new(set_booking_params)
    booking.payment_status = 'Pending'
    booking.update(office: office)
    booking.update(user: current_user)
    booking.update(amount: compute_price(booking))

    booking.save!
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
        line_items: [{ name: office.name,
                       images: [office.photo],
                       amount: booking.amount,
                       currency: 'eur',
                       quantity: 1 }],
      success_url: order_url(order),
      cancel_url: order_url(order)
    )

    booking.update(checkout_session_id: session.id)
    redirect_to new_booking_payment_path(booking)
    # if @booking.save
    #  redirect_to dashboards_path
    # else
    #  render :new
    # end
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

  def compute_price(booking)
    number_of_days = booking.end_date - booking.start_date
    number_of_days * booking.garden.price
  end

  def find_booking
    @booking = current_user.bookings.find(params[:id])
  end

  def set_booking_params
    params.require(:booking).permit(:start_date, :end_date, :number_of_people)
  end
end
