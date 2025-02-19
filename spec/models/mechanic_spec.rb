require 'rails_helper'

RSpec.describe Mechanic, type: :model do

  describe 'Relationships' do
    it { should belong_to :amusement_park}
    it { should have_many :ride_mechanics}
    it { should have_many(:rides).through(:ride_mechanics)}
  end

  before :each do
    @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
    @universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)

    @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
    @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
    @ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)

    @jaws = @universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)

    @mech1 = @six_flags.mechanics.create!(name: 'James Guy', years_experience: 13)
    @mech2 = @six_flags.mechanics.create!(name: 'Laura Coaster', years_experience: 3)
    @mech3 = @universal.mechanics.create!(name: 'Remi Pathos', years_experience: 22)
    @mechanics = Mechanic.all
  end

  describe 'Class Methods' do
    it '#avg_years' do
      expect(@mechanics.avg_years.round(2)).to eq(12.67)
    end
  end
end