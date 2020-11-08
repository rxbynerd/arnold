class Arnold::CLI
  def self.run(args)
    new(args).run
  end

  def initialize(args)
    @command = args.shift
    @args = args
  end

  def run
    case @command
    when 'import'
      blob = Oj.load File.read @args.first
      feature = Arnold::Determinator::FeatureDeserializer.deserialize(blob)

      feature.save!

      puts feature.id
    when 'export', 'dump'
      id = @args.first
      feature = Arnold::Feature.find id

      puts feature.attributes
      puts feature.target_groups.as_json
      puts feature.overrides.as_json

      puts Oj.dump(Arnold::Determinator::FeatureSerializer.serialize(feature))
    when 'console', 'cli', 'c'
      $stderr.puts "starting #{Arnold.env} console..."
      require 'pry'
      Pry.start
    else
      $stderr.puts "unknown command: '#{@command}'"
      exit 127
    end
  end
end
