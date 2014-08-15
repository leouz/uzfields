require 'rails_helper'

RSpec.describe "one_fields/new", :type => :view do
  before(:each) do
    assign(:one_field, OneField.new(
      :string_field => "MyString"
    ))
  end

  it "renders new one_field form" do
    render

    assert_select "form[action=?][method=?]", one_fields_path, "post" do

      assert_select "input#one_field_string_field[name=?]", "one_field[string_field]"
    end
  end
end
