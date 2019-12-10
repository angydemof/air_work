class CreateOffices < ActiveRecord::Migration[5.2]
  def change
    create_table :offices do |t|
      t.string :name
      t.text :description
      t.string :address
      t.integer :capacity
      t.integer :size
      t.string :photo
      t.string :type
      t.references :user, foreign_key: true
      t.boolean :wifi
      t.boolean :coffee_machine
      t.boolean :smoking_area
      t.boolean :pets_allowed
      t.boolean :printer
      t.boolean :kitchen
      t.boolean :terrace
      t.timestamps
    end
  end
end
