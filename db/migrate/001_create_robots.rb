require 'sequel'

environments = ["test", "development"]

environments.each do |env|
  Sequel.sqlite("db/golem_yard_#{env}.sqlite3").create_table(:robots) do
    primary_key :id
    String      :name
    String      :city
    String      :state
    String      :avatar
    Date        :birthdate
    Date        :date_hired
    String      :department
  end
end

#name, city, state, avatar, birthdate, date hired, and department
