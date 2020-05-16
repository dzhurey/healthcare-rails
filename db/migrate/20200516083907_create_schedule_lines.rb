class CreateScheduleLines < ActiveRecord::Migration[6.0]
  def change
    create_table :schedule_lines do |t|
      t.references :schedule, null: false, foreign_key: true
      t.integer :day_of_week, null: false
      t.time :start, null: false
      t.time :end, null: false

      t.timestamps
    end
  end
end
