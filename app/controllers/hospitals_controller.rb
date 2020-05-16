class HospitalsController < ApplicationController
  before_action :set_resource, only: %i[show]

  def index
    @hospitals = Hospital.all
  end

  def show
    @schedules = @hospital.schedules
  end
end
