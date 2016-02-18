require 'sequel'

environments = ["test", "development"]

environments.each do |env|
  Sequel.sqlite("db/golem_yard_#{env}.sqlite3").alter_table(:robots) do
    drop_column :state
    drop_column :birthdate
    drop_column :date_hired
  end
end
