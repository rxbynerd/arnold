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
      target_groups: serialize_target_groups,
      active: @feature.active,
      overrides: serialize_overrides
    }
  end

  private
  def serialize_target_groups
    []
  end

  def serialize_overrides
    @feature.overrides.reduce({}) do |overrides, override|
      overrides.update(override.key => override.result)
    end
  end
end
