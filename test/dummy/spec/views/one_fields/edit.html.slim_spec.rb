require 'rails_helper'

RSpec.describe "one_fields/edit", :type => :view do
  before(:each) do
    @one_field = assign(:one_field, OneField.create!(
      :string_field => "MyString"
    ))
  end

  it "renders the edit one_field form" do
    render

    assert_select "form[action=?][method=?]", one_field_path(@one_field), "post" do

      assert_select "input#one_field_string_field[name=?]", "one_field[string_field]"
    end
  end
end
