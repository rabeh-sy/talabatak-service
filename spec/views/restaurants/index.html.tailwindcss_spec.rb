require 'rails_helper'

RSpec.describe "admin/restaurants/index", type: :view do
  before(:each) do
    assign(:restaurants, [
      Restaurant.create!(
        name: "Name",
        description: "MyText",
        status: 2
      ),
      Restaurant.create!(
        name: "Name",
        description: "MyText",
        status: 2
      )
    ])
  end

  # it "renders a list of restaurants" do
  #   render
  #   cell_selector = 'div>p'
  #   assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
  #   assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
  #   assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
  # end
end
