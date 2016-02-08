class Robot
  attr_reader :id,
              :name,
              :city,
              :state,
              :birthdate,
              :date_hired,
              :department,
              :avatar,
              :data

  def initialize(data)
    @data       = data
    @id         = data[:id]
    @name       = data[:name]
    @city       = data[:city]
    @state      = data[:state].capitalize
    @birthdate  = data[:birthdate]
    @date_hired = data[:date_hired]
    @department = data[:department].capitalize
    @avatar     = generate_avatar
  end

  def generate_avatar
    if city.length % 2 == 0  #generate randomness in images
      "https://robohash.org/#{name + department}?bgset=bg1&size=200x200"
    else
      "https://robohash.org/#{name + department}?bgset=bg2&size=200x200"
    end
  end
end



  #name, city, state, avatar, birthdate, date hired, and department
