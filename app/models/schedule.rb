class Schedule < ApplicationRecord
  belongs_to :doctor
  belongs_to :hospital
  has_many   :schedule_lines, dependent: :delete_all
end
