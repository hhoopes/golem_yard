require 'sequel'

# if ENV["RACK_ENV"] == "test"
database = Sequel.sqlite("db/golem_yard_dev.sqlite3")
  database = Sequel.sqlite("db/golem_yard_test.sqlite3")
# else
# end

database.create_table(:robots) do
  primary_key :id
  String      :name
  String      :city
  String      :state
  String      :avatar
  DateTime    :birthdate
  DateTime    :date_hired
  String      :department
end

#name, city, state, avatar, birthdate, date hired, and department
