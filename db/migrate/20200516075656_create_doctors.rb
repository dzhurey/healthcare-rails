class CreateDoctors < ActiveRecord::Migration[6.0]
  def change
    create_table :doctors do |t|
      t.string :name,       null: false
      t.string :speciality, null: false, default: 'General'
      t.text :about,        null: false, default: ''

      t.timestamps
    end
  end
end
