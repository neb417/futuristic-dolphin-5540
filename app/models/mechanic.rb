class Mechanic < ApplicationRecord
  
  def self.avg_years
    average(:years_experience)
  end
end