class AddVariantsToFeatures < ActiveRecord::Migration[6.0]
  def change
    add_column :features, :variants, :jsonb, default: nil
  end
end
