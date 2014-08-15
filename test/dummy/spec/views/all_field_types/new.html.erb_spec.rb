require 'rails_helper'

RSpec.describe "all_field_types/new", :type => :view do
  before(:each) do
    assign(:all_field_type, AllFieldType.new(
      :string_field => "MyString",
      :mask_field => "MyString",
      :permalink_field => "MyString",
      :email_field => "MyString",
      :pdf_field => "MyString",
      :file_field => "MyString",
      :image_field => "MyString",
      :password_field => "MyString",
      :select_field => "MyString",
      :radio_field => "MyString",
      :checkbox_field => false,
      :currency_field => "9.99",
      :float_field => 1.5,
      :decimal_field => "9.99",
      :integer_field => 1,
      :text_field => "MyText",
      :wysi_field => "MyText"
    ))
  end

  it "renders new all_field_type form" do
    render

    assert_select "form[action=?][method=?]", all_field_types_path, "post" do

      assert_select "input#all_field_type_string_field[name=?]", "all_field_type[string_field]"

      assert_select "input#all_field_type_mask_field[name=?]", "all_field_type[mask_field]"

      assert_select "input#all_field_type_permalink_field[name=?]", "all_field_type[permalink_field]"

      assert_select "input#all_field_type_email_field[name=?]", "all_field_type[email_field]"

      assert_select "input#all_field_type_pdf_field[name=?]", "all_field_type[pdf_field]"

      assert_select "input#all_field_type_file_field[name=?]", "all_field_type[file_field]"

      assert_select "input#all_field_type_image_field[name=?]", "all_field_type[image_field]"

      assert_select "input#all_field_type_password_field[name=?]", "all_field_type[password_field]"

      assert_select "input#all_field_type_select_field[name=?]", "all_field_type[select_field]"

      assert_select "input#all_field_type_radio_field[name=?]", "all_field_type[radio_field]"

      assert_select "input#all_field_type_checkbox_field[name=?]", "all_field_type[checkbox_field]"

      assert_select "input#all_field_type_currency_field[name=?]", "all_field_type[currency_field]"

      assert_select "input#all_field_type_float_field[name=?]", "all_field_type[float_field]"

      assert_select "input#all_field_type_decimal_field[name=?]", "all_field_type[decimal_field]"

      assert_select "input#all_field_type_integer_field[name=?]", "all_field_type[integer_field]"

      assert_select "textarea#all_field_type_text_field[name=?]", "all_field_type[text_field]"

      assert_select "textarea#all_field_type_wysi_field[name=?]", "all_field_type[wysi_field]"
    end
  end
end
