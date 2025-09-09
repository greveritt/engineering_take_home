class CreateCustomEnumFieldValues < ActiveRecord::Migration[7.2]
  def change
    create_table :custom_enum_field_values do |t|
      t.references :custom_enum_field_choice, null: false, foreign_key: true
      t.references :building, null: false, foreign_key: true

      t.timestamps
    end
  end
end
