class CreateFeatures < ActiveRecord::Migration[6.0]
  def change
    create_table :features, id: :uuid do |t|
      t.string :identifier, null: false, length: 1024
      t.string :name, null: false, length: 1024
      t.text :description, null: true, length: 65535
      t.integer :bucket_type, default: 0, null: false
      t.boolean :active, default: false, null: false
      t.string :winning_variant, length: 255

      t.jsonb :variants, default: {}, null: false

      t.timestamps
    end
  end
end
