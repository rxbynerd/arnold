class CreateTargetGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :target_groups, id: :uuid do |t|
      t.references :feature, foreign_key: true, type: :uuid

      t.integer :rollout, default: 0, null: false
      t.jsonb :constraints, default: {}
    end
  end
end
