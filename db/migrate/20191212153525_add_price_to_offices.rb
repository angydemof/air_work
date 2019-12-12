class AddPriceToOffices < ActiveRecord::Migration[5.2]
  def change
    add_monetize :offices, :price, currency: { present: false }
  end
end
