require 'rails_helper'

RSpec.describe "apartments/index", type: :view do
  before(:each) do
    assign(:apartments, [
      Apartment.create!(
        :street1 => "Street1",
        :street2 => "Street2",
        :city => "City",
        :postal_code => 2,
        :state => "State",
        :country => "Country",
        :manager => "Manager",
        :phone => "Phone",
        :contact_hours => "Contact Hours"
      ),
      Apartment.create!(
        :street1 => "Street1",
        :street2 => "Street2",
        :city => "City",
        :postal_code => 2,
        :state => "State",
        :country => "Country",
        :manager => "Manager",
        :phone => "Phone",
        :contact_hours => "Contact Hours"
      )
    ])
  end

  it "renders a list of apartments" do
    render
    assert_select "tr>td", :text => "Street1".to_s, :count => 2
    assert_select "tr>td", :text => "Street2".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "State".to_s, :count => 2
    assert_select "tr>td", :text => "Country".to_s, :count => 2
    assert_select "tr>td", :text => "Manager".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Contact Hours".to_s, :count => 2
  end
end
