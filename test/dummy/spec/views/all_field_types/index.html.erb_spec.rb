require 'rails_helper'

RSpec.describe "all_field_types/index", :type => :view do
  before(:each) do
    assign(:all_field_types, [
      AllFieldType.create!(
        :string_field => "String Field",
        :mask_field => "Mask Field",
        :permalink_field => "Permalink Field",
        :email_field => "Email Field",
        :pdf_field => "Pdf Field",
        :file_field => "File Field",
        :image_field => "Image Field",
        :password_field => "Password Field",
        :select_field => "Select Field",
        :radio_field => "Radio Field",
        :checkbox_field => false,
        :currency_field => "9.99",
        :float_field => 1.5,
        :decimal_field => "9.99",
        :integer_field => 1,
        :text_field => "MyText",
        :wysi_field => "MyText"
      ),
      AllFieldType.create!(
        :string_field => "String Field",
        :mask_field => "Mask Field",
        :permalink_field => "Permalink Field",
        :email_field => "Email Field",
        :pdf_field => "Pdf Field",
        :file_field => "File Field",
        :image_field => "Image Field",
        :password_field => "Password Field",
        :select_field => "Select Field",
        :radio_field => "Radio Field",
        :checkbox_field => false,
        :currency_field => "9.99",
        :float_field => 1.5,
        :decimal_field => "9.99",
        :integer_field => 1,
        :text_field => "MyText",
        :wysi_field => "MyText"
      )
    ])
  end

  it "renders a list of all_field_types" do
    render
    assert_select "tr>td", :text => "String Field".to_s, :count => 2
    assert_select "tr>td", :text => "Mask Field".to_s, :count => 2
    assert_select "tr>td", :text => "Permalink Field".to_s, :count => 2
    assert_select "tr>td", :text => "Email Field".to_s, :count => 2
    assert_select "tr>td", :text => "Pdf Field".to_s, :count => 2
    assert_select "tr>td", :text => "File Field".to_s, :count => 2
    assert_select "tr>td", :text => "Image Field".to_s, :count => 2
    assert_select "tr>td", :text => "Password Field".to_s, :count => 2
    assert_select "tr>td", :text => "Select Field".to_s, :count => 2
    assert_select "tr>td", :text => "Radio Field".to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
