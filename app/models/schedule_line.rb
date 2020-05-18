class ScheduleLine < ApplicationRecord
  belongs_to :schedule

  enum day_of_week: %w[Monday Tuesday Wednesday Thursday Friday Saturday Sunday]
end
