require 'sequel'

environments = ["test", "development"]

environments.each do |env|
  Sequel.sqlite("db/golem_yard_#{env}.sqlite3").drop_table(:robots)
end
