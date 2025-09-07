class CreateCustomNumberFieldValues < ActiveRecord::Migration[7.2]
  def change
    create_table :custom_number_field_values do |t|
      t.decimal :value, null: false
      t.references :custom_number_field, null: false, foreign_key: true
      t.references :building, null: false, foreign_key: true

      t.timestamps
    end
  end
end
