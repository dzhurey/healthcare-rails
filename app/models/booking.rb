class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :schedule_line
end
