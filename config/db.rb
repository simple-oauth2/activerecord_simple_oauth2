OTR::ActiveRecord.configure_from_hash!(adapter: 'sqlite3', database: ':memory:')

ActiveRecord::Base.logger = nil
ActiveRecord::Migration.verbose = false
