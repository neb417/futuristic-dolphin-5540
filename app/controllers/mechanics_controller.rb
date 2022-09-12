class MechanicsController < ApplicationController

  def index
    @mechanics = Mechanic.all
    @avg_years = @mechanics.avg_years
  end

  # def mech_avg_years
  #   mechanics = Mechanic.all
  #   mechanics.avg_years
  # end
end