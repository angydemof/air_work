class CreateOffices < ActiveRecord::Migration[5.2]
  def change
    create_table :offices do |t|
      t.string :name
      t.text :description
      t.string :address
      t.integer :capacity
      t.integer :size
      t.references :photo, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :wifi
      t.boolean :coffee_machine
      t.boolean :somking_area

      t.timestamps
    end
  end
end
