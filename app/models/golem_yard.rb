class GolemYard
  attr_reader :database

  def initialize(database)
    @database = database
  end

  def create(robot)
    database.from(:robots).insert(robot)
  end

  def all
    database.from(:robots).to_a.map { |data| Robot.new(data)}
  end

  def find(id)
    result = database.from(:robots).where(:id => id).to_a.first
    Robot.new(result)
  end

  def update(robot, id) #adjust for all the characteristics
    database.from(:robots).where(:id => id).update(robot)
  end

  def delete(id)
    database.from(:robots).where(:id => id).delete
  end

  def sample
    id = database[:robots].first.fetch :id
    find(id)
  end
end
