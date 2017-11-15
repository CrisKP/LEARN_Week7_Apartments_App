require 'rails_helper'


RSpec.feature "ApartmentListings", type: :feature do
  context "index page" do
    Steps "Going to the landing page" do
      Given "I visit localhost 3000:" do
        visit "/apartments"
      end
      Then "I see the apartment listings" do
        expect(page).to have_content('Street1', 'Postal code')
      end
    end
  end

  context "Create new apartment" do
    Steps "Going to the create new apartment listing page" do
      Given "I visit the create new apartment page" do
        visit "/apartments/new"
      end
      Then "I can fill in the fields to create an apartment listing" do
        fill_in 'apartment_street1', with: 'Test Street 1'
        fill_in 'apartment_street2', with: 'Test Street 2'
        fill_in 'apartment_city', with: 'Test City'
        fill_in 'apartment_postal_code', with: '92122'
        fill_in 'apartment_state', with: 'Test State'
        fill_in 'apartment_country', with: 'Test Country'
        fill_in 'apartment_manager', with: 'Manager name'
        fill_in 'apartment_phone', with: '619-555-5555'
        fill_in 'apartment_contact_hours', with: '9am - 5pm'
        page.attach_file('apartment[image]', Rails.root + 'app/assets/images/apartmentx.jpg')
      end
      And "I can submit the information" do
        click_button "Create Apartment"
      end
      Then "I can see the listing I created" do
        expect(page).to have_content('Apartment was successfully created.')
        expect(page).to have_current_path(/apartments\/[0-9]+/)
      end
      Then "I can click to go back to the listings" do
        click_link "Back"
      end
      Then "I am taken to the index page" do
        expect(page).to have_current_path(/apartments/)
      end
      Then "my new listing is on the index page" do
        expect(page).to have_content('619-555-5555', '9am - 5pm')
        # expect(page).to have_xpath("//img")
        expect(page).to have_xpath("//img[contains(@src, 'apartmentx.jpg')]")
      end
    end
  end
end
