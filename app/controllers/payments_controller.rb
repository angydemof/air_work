class PaymentsController < ApplicationController
  def new
    @booking = current_user.bookings.where(payment_status: 'Pending').find(params[:booking_id])
  end
end
