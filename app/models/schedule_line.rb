class ScheduleLine < ApplicationRecord
  belongs_to :schedule

  enum day_of_week: %w[Sunday Monday Tuesday Wednesday Thursday Friday Saturday]
end
