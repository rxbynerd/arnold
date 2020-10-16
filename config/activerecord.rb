if ENV['DATABASE_URL'].present?
  ActiveRecord::Base.establish_connection
else
  ActiveRecord::Base.establish_connection YAML.load_file(Arnold.root.join('config', 'database.yml'))[Arnold.env].symbolize_keys
end
