ENV['ARNOLD_ENV'] ||= 'test'

require File.expand_path('../../env', __FILE__)

RSpec.configure do |x|
  x.include(Rack::Test::Methods, type: :app)
  x.include(Module.new do
    def app
      described_class
    end
  end, type: :app)
end
