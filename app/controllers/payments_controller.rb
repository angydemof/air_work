class PaymentsController < ApplicationController
  def new
    @booking = current_user.bookings.where(payment_status: 'pending').find(params[:booking_id])
  end
end
