class Hospital < ApplicationRecord
  has_many :schedules
  has_many :doctors, through: :schedules
end
