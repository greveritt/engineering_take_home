class CreateCustomEnumFieldChoices < ActiveRecord::Migration[7.2]
  def change
    create_table :custom_enum_field_choices do |t|
      t.string :value, null: false
      t.references :custom_enum_field, null: false, foreign_key: true

      t.timestamps
    end
  end
end
