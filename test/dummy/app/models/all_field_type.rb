class AllFieldType < ActiveRecord::Base
  attr_accessible :checkbox_field, :currency_field, :date_field, :datetime_field, :decimal_field, :email_field, :file_field, :float_field, :image_field, :integer_field, :mask_field, :password_field, :pdf_field, :permalink_field, :radio_field, :select_field, :string_field, :text_field, :time_field, :timestamp_field, :wysi_field
end
