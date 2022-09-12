require 'rails_helper'

RSpec.describe 'Mechanic Index Page' do
  let(:amuse) {AmusementPark.create(name: 'Elitches', admission_cost: 45)}

  let(:ride1) { Ride.create(name: 'Twister', thrill_rating: 4)}
  let(:ride2) { Ride.create(name: 'Teacups', thrill_rating: 2)}
  let(:ride3) { Ride.create(name: 'Slingshot', thrill_rating: 10)}
  let(:ride4) { Ride.create(name: 'Mind Eraser', thrill_rating: 7)}

  let(:mech1) {Mechanic.create(name: 'James Guy', years_experience: 13)}
  let(:mech2) {Mechanic.create(name: 'Laura Coaster', years_experience: 3)}
  let(:mech3) {Mechanic.create(name: 'Remi Pathos', years_experience: 22)}

  describe 'As a user' do
    describe 'User Story 1 when visiting the mechanic show page' do
      it "I see a header saying 'All Mechanics'" do
        visit '/mechanics'

        expect(page).to have_content('All Mechanics')
        expect(page).to_not have_content('Elitches')
      end

      xit 'displays a list of all the mechanics and their years of experience' do
        visit '/mechanics'

        expect(page).to have_content(mech1.name)
        expect(page).to have_content(mech1.years_experience)

        expect(page).to have_content(mech2.name)
        expect(page).to have_content(mech2.years_experience)

        expect(page).to have_content(mech3.name)
        expect(page).to have_content(mech3.years_experience)

        expect(page).to_not have_content(ride1.name)
        expect(page).to_not have_content(amuse.name)
      end

      xit 'displays the average experience for the mechanics' do
        visit '/mechanics'

        expect(page).to have_content("Average experience of Mechanics: 12.67")
      end
    end
  end
end