class CreateCustomFreeformFieldValues < ActiveRecord::Migration[7.2]
  def change
    create_table :custom_freeform_field_values do |t|
      t.string :value, null: false
      t.references :custom_freeform_field, null: false, foreign_key: true
      t.references :building, null: false, foreign_key: true

      t.timestamps
    end
  end
end
