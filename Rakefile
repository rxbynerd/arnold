require 'bundler'
Bundler.require

task :environment do
  require './env'
end

namespace :db do
  task :load_config do
    ActiveRecord::Tasks::DatabaseTasks.db_dir = 'db'
    ActiveRecord::Tasks::DatabaseTasks.migrations_paths = %w{db/migrate}
    ActiveRecord::Tasks::DatabaseTasks.env = Arnold.env
    ActiveRecord::Tasks::DatabaseTasks.seed_loader = Class.new do
      def load_seed(*_)
      end
    end.new

    if ENV['DATABASE_URL'].present?
      ActiveRecord::Tasks::DatabaseTasks.database_configuration = {
        Arnold.env.to_sym => ENV['DATABASE_URL']
      }
    else
      ActiveRecord::Tasks::DatabaseTasks.database_configuration = YAML.load_file(Arnold.root.join('config', 'database.yml')).tap do |db_config|
        ActiveRecord::Base.establish_connection db_config[Arnold.env]
      end
    end
  end
end

load 'active_record/railties/databases.rake'
