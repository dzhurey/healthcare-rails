class GetBookingsService
  def perform
    start_date = Date.today.beginning_of_week
    end_date = Date.today.end_of_week
    bookings = Booking.includes(schedule_line: [schedule: [:doctor, :hospital]]).where('date BETWEEN ? AND ?', start_date, end_date)
    {
      schedules: bookings.map { |booking| booking.schedule_line.schedule }.uniq { |x| x.id },
      bookings: bookings
    }
  end
end
