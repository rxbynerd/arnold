require 'pathname'
require 'singleton'

require 'bundler'

Bundler.require

module Arnold
  class << self
    @@root = Pathname.new File.expand_path File.dirname __FILE__
    @@env = ActiveSupport::StringInquirer.new (ENV['ARNOLD_ENV'] || ENV['RAILS_ENV'] || 'development').clone.freeze

    def root
      @@root
    end

    def env
      @@env
    end
  end
end

Bundler.require Arnold.env.to_sym

require Arnold.root.join('config', 'activerecord')

Oj.default_options = { mode: :compat }

$:.unshift Arnold.root.join('lib').to_s
require 'arnold'
