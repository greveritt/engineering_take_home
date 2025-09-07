class CreateCustomFreeformFields < ActiveRecord::Migration[7.2]
  def change
    create_table :custom_freeform_fields do |t|
      t.string :name, null: false
      t.references :client, null: false, foreign_key: true

      t.timestamps
    end
  end
end
