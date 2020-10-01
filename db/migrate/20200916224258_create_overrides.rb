class CreateOverrides < ActiveRecord::Migration[6.0]
  def change
    create_table :overrides, id: :uuid do |t|
      t.references :feature, foreign_key: true, type: :uuid

      t.string :key, null: false, length: 1024
      t.jsonb :result

      t.timestamps
    end
  end
end
