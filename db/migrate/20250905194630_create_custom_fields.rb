class CreateCustomFields < ActiveRecord::Migration[7.2]
  def change
    create_enum :custom_field_type, %i[number freeform enum]

    create_table :custom_fields do |t|
      t.string :name, null: false, index: { unique: true }
      t.enum :type, enum_type: :custom_field_type, null: false
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
