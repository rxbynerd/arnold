# writes Arnold::Feature to Consul
class Arnold::Writers::ConsulWriter
  def self.write(feature)
    value = Oj.dump(Arnold::Determinator::FeatureSerializer.serialize(feature))

    Diplomat::Kv.put("arnold/features/#{feature.identifier}", value)
  end
end
