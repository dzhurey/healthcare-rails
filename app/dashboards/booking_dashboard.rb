require "administrate/custom_dashboard"

class BookingDashboard < Administrate::CustomDashboard
  resource "Bookings" # used by administrate in the views
end