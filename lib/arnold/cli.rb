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
