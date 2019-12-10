class CreatePhotos < ActiveRecord::Migration[5.2]
  def change
    create_table :photos do |t|
      t.string :photo_1
      t.string :photo_2
      t.string :photo_3

      t.timestamps
    end
  end
end
