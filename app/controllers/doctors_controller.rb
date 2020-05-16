class DoctorsController < ApplicationController
  before_action :set_resource, only: %i[show]

  def index
    @doctors = Doctor.all
  end

  def show
    @schedules = @doctor.schedules
  end
end
