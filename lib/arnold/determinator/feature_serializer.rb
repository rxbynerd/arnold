# FeatureSerializer seralizes an Arnold feature into a Determinator JSON blob
class Arnold::Determinator::FeatureSerializer
  def self.serialize(feature)
    new(feature).serialize
  end

  def initialize(feature)
    @feature = feature
  end

  def serialize
    {
      id: @feature.id,
      name: @feature.name,
      identifier: @feature.identifier,
      bucket_type: @feature.bucket_type,
      active: @feature.active,
      target_groups: serialize_target_groups,
      overrides: serialize_overrides,
    }.merge(experiment_properties)
  end

  def experiment_properties
    if @feature.variants.any?
      {
        variants: @feature.variants,
      }
    else
      {}
    end
  end

  private
  def serialize_target_groups
    @feature.target_groups.map do |target_group|
      {
        rollout: target_group.rollout,
        constraints: target_group.constraints, # TODO unfuck
      }
    end
  end

  def serialize_overrides
    @feature.overrides.reduce({}) do |overrides, override|
      overrides.update(override.key => override.result)
    end
  end
end
