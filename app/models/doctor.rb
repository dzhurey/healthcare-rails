class Doctor < ApplicationRecord
  has_many :schedules
  has_many :hospitals, through: :schedules
end
