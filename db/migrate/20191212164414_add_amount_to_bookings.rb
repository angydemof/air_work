class AddAmountToBookings < ActiveRecord::Migration[5.2]
  def change
    add_column :bookings, :checkout_session_id, :string
    add_monetize :bookings, :amount, currency: { present: false }
  end
end
