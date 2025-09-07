class CreateCustomEnumFields < ActiveRecord::Migration[7.2]
  def change
    create_table :custom_enum_fields do |t|
      t.string :name, null: false
      # TODO: Move choices into a table and maintain foreign key constraints w/ selections
      t.string :choices, array: true, null: false
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
