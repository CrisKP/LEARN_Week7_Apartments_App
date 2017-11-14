require 'rails_helper'

RSpec.describe "apartments/show", type: :view do
  before(:each) do
    @apartment = assign(:apartment, Apartment.create!(
      :street1 => "Street1",
      :street2 => "Street2",
      :city => "City",
      :postal_code => 2,
      :state => "State",
      :country => "Country",
      :manager => "Manager",
      :phone => "Phone",
      :contact_hours => "Contact Hours"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Street1/)
    expect(rendered).to match(/Street2/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/State/)
    expect(rendered).to match(/Country/)
    expect(rendered).to match(/Manager/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Contact Hours/)
  end
end
