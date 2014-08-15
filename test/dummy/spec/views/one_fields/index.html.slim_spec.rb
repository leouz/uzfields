require 'rails_helper'

RSpec.describe "one_fields/index", :type => :view do
  before(:each) do
    assign(:one_fields, [
      OneField.create!(
        :string_field => "String Field"
      ),
      OneField.create!(
        :string_field => "String Field"
      )
    ])
  end

  it "renders a list of one_fields" do
    render
    assert_select "tr>td", :text => "String Field".to_s, :count => 2
  end
end
