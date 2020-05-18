class BookingsController < ApplicationController
  before_action :configure_body, only: %i[create]

  def index
    @bookings = current_user.bookings
  end

  def new
    @schedule_line = ScheduleLine.find(params[:id])
  end

  def create
    @schedule_line = ScheduleLine.find(params[:id])
    form = BookingForm.new(current_user, params[:booking])

    if form.save
      redirect_to bookings_path, notice: 'Your booking success'
    else
      redirect_to booking_new_path(@schedule_line), alert: form.errors.full_messages.join(', ')
    end
  end

  private

  def configure_body
    added_attrs = %i[date schedule_line_id]
    params.require(:booking).permit(added_attrs)
  end
end
