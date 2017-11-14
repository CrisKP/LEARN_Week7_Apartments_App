require 'rails_helper'


RSpec.feature "ApartmentListings", type: :feature do
  context "index page" do
    Steps "Going to the landing page" do
      Given "I visit localhost 3000:" do
        visit "/apartments"
      end
    end
  end
end
