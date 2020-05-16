class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.references :doctor, null: false, foreign_key: true
      t.references :hospital, null: false, foreign_key: true

      t.timestamps
    end
  end
end
