class CreateHospitals < ActiveRecord::Migration[6.0]
  def change
    create_table :hospitals do |t|
      t.string :name, null: false, default: ''
      t.text :address, null: false, default: ''
      t.text :about, null: false, default: ''

      t.timestamps
    end
  end
end
