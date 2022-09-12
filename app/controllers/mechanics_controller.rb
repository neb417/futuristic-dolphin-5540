class MechanicsController < ApplicationController

  def index
    @mechanics = Mechanic.all
    @avg_years = @mechanics.avg_years
  end

  def show
    @mechanic = Mechanic.find(params[:id])
    @rides = @mechanic.rides
  end
end