class GetBookingsService
  def perform(weeks_from_now)
    today = Date.today + (weeks_from_now * 7).days
    start_date = today.beginning_of_week
    end_date = today.end_of_week
    bookings = Booking.includes(schedule_line: [schedule: [:doctor, :hospital]]).where('date >= ? AND date <= ?', start_date, end_date)
    {
      schedules: bookings.map { |booking| booking.schedule_line.schedule }.uniq { |x| x.id },
      bookings: bookings
    }
  end
end
