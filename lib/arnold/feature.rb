class Arnold::Feature < Arnold::Model
  has_many :overrides
  has_many :target_groups

  enum bucket_type: %i{id guid}

  # attr_accessor :id, :name, :identifier, :bucket_type, :target_groups, :active, :variants, :winning_variant, :overrides, :fixed_determinations
end
