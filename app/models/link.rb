require 'dm-migrations'
require 'data_mapper'
require 'dm-postgres-adapter'

class Link
  include DataMapper::Resource

  DataMapper::Logger.new($stdout, :debug)
  DataMapper.setup(:default, "postgres://localhost/bookmark_manager_test")

  property :id, Serial
  property :title, String
  property :url, String

  DataMapper.finalize
  DataMapper.auto_upgrade!

end
