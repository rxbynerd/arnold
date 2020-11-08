# FeatureDeserializer converts a JSON payload into a Feature
class Arnold::Determinator::FeatureDeserializer
  def self.deserialize(blob)
    new(blob).deserialize
  end

  def initialize(blob)
    @blob = blob
  end

  def deserialize
    @feature = Arnold::Feature.new(
      name: @blob['name'],
      identifier: @blob['identifier'],
      bucket_type: @blob['bucket_type'],
      active: @blob['active'],
      variants: @blob['variants'],
      overrides: build_overrides,
      target_groups: build_target_groups,
    )
  end

  private
  def build_target_groups
    @blob['target_groups'].map do |target_group|
      Arnold::TargetGroup.new(
        rollout: target_group['rollout'],
        constraints: target_group['constraints'] # TODO actually validate this garbage
      )
    end
  end

  def build_overrides
    @blob['overrides'].map do |(key, result)|
      Arnold::Override.new(key: key, result: result)
    end
  end
end
