require 'rails_helper'

RSpec.describe "all_field_types/show", :type => :view do
  before(:each) do
    @all_field_type = assign(:all_field_type, AllFieldType.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/String Field/)
    expect(rendered).to match(/Mask Field/)
    expect(rendered).to match(/Permalink Field/)
    expect(rendered).to match(/Email Field/)
    expect(rendered).to match(/Pdf Field/)
    expect(rendered).to match(/File Field/)
    expect(rendered).to match(/Image Field/)
    expect(rendered).to match(/Password Field/)
    expect(rendered).to match(/Select Field/)
    expect(rendered).to match(/Radio Field/)
    expect(rendered).to match(/false/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/1/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
  end
end
