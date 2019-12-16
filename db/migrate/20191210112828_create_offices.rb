class CreateOffices < ActiveRecord::Migration[5.2]
  def change
    create_table :offices do |t|
      t.string :name
      t.text :description
      t.string :address
      t.integer :capacity
      t.integer :size
      t.string :photo
      t.string :office_type
      t.references :user, foreign_key: true
      t.boolean :wifi, default: false
      t.boolean :coffee_machine, default: false
      t.boolean :smoking_area, default: false
      t.boolean :pets_allowed, default: false
      t.boolean :printer, default: false
      t.boolean :kitchen, default: false
      t.boolean :terrace, default: false
      t.boolean :lunch_included, default: false
      t.boolean :heater_ac, default: false
      t.boolean :adaptors, default: false
      t.timestamps
    end
  end
end
