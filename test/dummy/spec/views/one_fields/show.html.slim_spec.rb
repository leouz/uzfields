require 'rails_helper'

RSpec.describe "one_fields/show", :type => :view do
  before(:each) do
    @one_field = assign(:one_field, OneField.create!(
      :string_field => "String Field"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/String Field/)
  end
end
