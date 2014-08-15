class CreateAllFieldTypes < ActiveRecord::Migration
  def change
    create_table :all_field_types do |t|
      t.string :string_field
      t.string :mask_field
      t.string :permalink_field
      t.string :email_field
      t.string :pdf_field
      t.string :file_field
      t.string :image_field
      t.string :password_field
      t.string :select_field
      t.string :radio_field
      t.boolean :checkbox_field
      t.date :date_field
      t.time :time_field
      t.timestamp :timestamp_field
      t.datetime :datetime_field
      t.decimal :currency_field
      t.float :float_field
      t.decimal :decimal_field
      t.integer :integer_field
      t.text :text_field
      t.text :wysi_field

      t.timestamps
    end
  end
end
