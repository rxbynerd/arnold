# This slapper of a migration is necessary for CockroachDB/PostgreSQL cross-compatibility.
# CockroachDB does not have a pg_crypto module, and crypto functions are available without an extension load.
# PostgreSQL requires the extension to be loaded before you can use crypto functions.
# We use gen_random_uuid() for the ID's of our records.
class EnablePgcryptoIfAvailable < ActiveRecord::Migration[6.0]
  def up
    res = ActiveRecord::Base.connection.execute('select count(*) from pg_available_extensions where name = \'pgcrypto\'')

    if res.first['count'] > 0
      ActiveRecord::Base.connection.execute('CREATE EXTENSION IF NOT EXISTS pg_crypto')
    end
  end

  def down
    # Good luck!
  end
end
