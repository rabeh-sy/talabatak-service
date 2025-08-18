require 'rails_helper'

RSpec.describe "admin/restaurants/show", type: :view do
  before(:each) do
    assign(:restaurant, Restaurant.create!(
      name: "Name",
      description: "MyText",
      status: "active"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/active/)
  end
end
