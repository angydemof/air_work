class CreateOfficeSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :office_schedules do |t|
      t.references :office, foreign_key: true
      t.references :schedule, foreign_key: true

      t.timestamps
    end
  end
end
