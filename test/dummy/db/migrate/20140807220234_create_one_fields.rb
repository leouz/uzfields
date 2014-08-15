class CreateOneFields < ActiveRecord::Migration
  def change
    create_table :one_fields do |t|
      t.string :string_field

      t.timestamps
    end
  end
end
