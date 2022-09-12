require 'rails_helper'

RSpec.describe 'Mechanic Index Page' do
  # describe 'objects of tests' do
  #   let(:six_flags) {AmusementPark.create(name: 'Six Flags', admission_cost: 75)}
  #   let(:universal) {AmusementPark.create(name: 'Universal Studios', admission_cost: 80)}

  #   let(:hurler) { six_flags.rides.create(name: 'The Hurler', thrill_rating: 7)}
  #   let(:scrambler) { six_flags.rides.create(name: 'The Scrambler', thrill_rating: 4)}
  #   let(:ferris) { six_flags.rides.create(name: 'Ferris Wheel', thrill_rating: 2)}
  #   let(:mind) { six_flags.rides.create(name: 'Mind Eraser', thrill_rating: 7)}
  #   let(:jaws) { universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)}


  #   let(:mech1) { Mechanic.create(name: 'James Guy', years_experience: 13) }
  #   let(:mech2) { Mechanic.create(name: 'Laura Coaster', years_experience: 3) }
  #   let(:mech3) { Mechanic.create(name: 'Remi Pathos', years_experience: 22) }
  # end

  before do
    @six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
    @universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)

    @hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
    @scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
    @ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)

    @jaws = @universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)

    @mech1 = Mechanic.create(name: 'James Guy', years_experience: 13)
    @mech2 = Mechanic.create(name: 'Laura Coaster', years_experience: 3)
    @mech3 = Mechanic.create(name: 'Remi Pathos', years_experience: 22)
  end

  describe 'As a user' do
    describe 'User Story 1 when visiting the mechanic show page' do
      it "I see a header saying 'All Mechanics'" do
        visit '/mechanics'

        expect(page).to have_content('All Mechanics')
        expect(page).to_not have_content('Elitches')
      end

      it 'displays a list of all the mechanics and their years of experience' do
        visit '/mechanics'

        expect(page).to have_content("Name: #{@mech1.name}")
        expect(page).to have_content("Years of experience: #{@mech1.years_experience}")

        expect(page).to have_content("Name: #{@mech2.name}")
        expect(page).to have_content("Years of experience: #{@mech2.years_experience}")

        expect(page).to have_content("Name: #{@mech3.name}")
        expect(page).to have_content("Years of experience: #{@mech3.years_experience}")

        expect(page).to_not have_content(@hurler.name)
        expect(page).to_not have_content(@six_flags.name)
      end

      it 'displays the average experience for the mechanics' do
        visit '/mechanics'

        expect(page).to have_content("Average experience of Mechanics: 12.67")
      end
    end
  end
end