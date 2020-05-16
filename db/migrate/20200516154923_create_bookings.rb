class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.references :user, null: false, foreign_key: true
      t.date :date, null: false
      t.references :schedule_line, null: false, foreign_key: true

      t.timestamps
    end
  end
end
