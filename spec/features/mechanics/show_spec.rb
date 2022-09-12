require 'rails_helper'

RSpec.describe 'Mechanic Show Page' do

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

    @mech1.rides << @hurler << @scrambler << @ferris
    @mech2.rides << @jaws << @scrambler << @hurler
  end

  describe 'As a user' do
    describe 'User Story 2 when visiting the mechanic show page' do
      it "user views mechanic's attributes" do
        visit "/mechanics/#{@mech1.id}"

        expect(page).to have_content("Name: #{@mech1.name}")
        expect(page).to have_content("Experience: #{@mech1.years_experience} years")

        expect(page).to_not have_content("Name: #{@mech2.name}")
        expect(page).to_not have_content("Experience: #{@mech2.years_experience} years")

        expect(page).to_not have_content("Name: #{@mech3.name}")
        expect(page).to_not have_content("Experience: #{@mech3.years_experience} years")

        expect(page).to_not have_content(@six_flags.name)
      end

      xit "displays the mechanic's list of open rides being worked on" do
        visit "/mechanics/#{@mech1.id}"

        expect(page).to have_content("Ride being repaired/maintained:")
        expect(page).to have_content(@hurler.name)
        expect(page).to have_content(@scrambler.name)

        expect(page).to_not have_content(@ferris.name)
        expect(page).to_not have_content(@jaws.name)
      end

      xit 'displays the list of rides being worked on by thrill rating' do
        visit "/mechanics/#{@mech2.id}"

        expect(@hurler.name).to appear_before(@jaws.name)
        expect(@jaws.name).to appear_before(@scrambler.name)
      end
    end
  end
end