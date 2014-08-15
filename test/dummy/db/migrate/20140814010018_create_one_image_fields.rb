class CreateOneImageFields < ActiveRecord::Migration
  def change
    create_table :one_image_fields do |t|
      t.string :image_field

      t.timestamps
    end
  end
end
