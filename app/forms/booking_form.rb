class BookingForm
  include ActiveModel::Model

  attr_accessor :date, :schedule_line_id, :user
  attr_reader :resource

  validates :date, presence: true, date_format: true
  validates :schedule_line_id, presence: true
  validate :date_is_correct?
  validate :unique_booking?
  validate :full_booked?
  validate :thirty_minute_before?

  def initialize(user, params = {})
    self.user = user
    self.date = params.fetch('date', nil)
    self.schedule_line_id = params.fetch('schedule_line_id', nil)
  end

  def save
    return false unless valid?

    @resource = create_booking
    true
  end

  private

  def schedule_line
    @schedule_line ||= ScheduleLine.find(schedule_line_id)
  end

  def date_time
    @date_time ||= Date.strptime(date, '%d/%m/%Y')
  end

  def create_booking
    Booking.create!(
      user: user,
      schedule_line_id: schedule_line_id,
      date: date
    )
  end

  def date_is_correct?
    if date_time.strftime('%A') != schedule_line.day_of_week
      errors.add(:date, 'does not match with schedule')
      return false
    end

    true
  end

  def unique_booking?
    if Booking.where(user: user, schedule_line: schedule_line, date: date).exists?
      errors.add(:user, 'already booked on this date')
      return false
    end

    true
  end

  def full_booked?
    if Booking.where(user: user, schedule_line: schedule_line, date: date).count >= 10
      errors.add(:schedule, 'is fully booked')
      return false
    end

    true
  end

  def thirty_minute_before?
    if late_booking?
      errors.add(:booking, 'must be at least 30 minutes before starting')
      return false
    end

    true
  end

  def late_booking?
    end_time = get_end_time(schedule_line.start.to_datetime)
    start_time = DateTime.now
    (end_time - start_time) >= 30.minutes
  end

  def get_end_time(adjusted_datetime)
    adjusted_datetime.change(
      day: date_time.day,
      month: date_time.month,
      year: date_time.year,
      offset: '+0700'
    )
  end
end
