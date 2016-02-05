require_relative "../test_helper"

class GolemYardTest < Minitest::Test
  include TestHelpers

  def create_robots(num)
    num.times do |i|
      golem_yard.create(
        name:       "name#{i+1}",
        city:       "city#{i+1}"
      )
    end
  end

  def test_can_create_a_robot
    golem_yard.create(
      name:       "name1",
      city:       "city1"
    )

    robot = golem_yard.all.last
    assert robot.id
    assert_equal "name1", robot.name
    assert_equal "city1", robot.city
  end

  def test_it_finds_all_robots
    create_robots(3)

    assert_equal 3, golem_yard.all.count

    golem_yard.all.each_with_index do |robot, index|
      assert_equal Robot, robot.class
      assert_equal "name#{index+1}", robot.name
      assert_equal "city#{index+1}", robot.city
    end
  end

  def test_it_finds_a_specific_robot
    create_robots(3)
    ids = golem_yard.all.map { |robot| robot.id }

    ids.each_with_index do |id, index|
      robot = golem_yard.find(id)
      assert_equal id, robot.id
      assert_equal "name#{index+1}", robot.name
      assert_equal "city#{index+1}", robot.city
    end
  end

  def test_it_updates_a_robot_record
    create_robots(2)

    new_data = {
      :name => "NEW name",
      :city => "NEW city"
    }
    id = golem_yard.all.last.id
    golem_yard.update(new_data, id)

    updated_robot = golem_yard.find(id)

    assert_equal new_data[:name], updated_robot.name
    assert_equal new_data[:city], updated_robot.city
  end

  def test_it_deletes_a_robot_record
    create_robots(3)

    initial_count = golem_yard.all.count
    id = golem_yard.all.last.id
    golem_yard.delete(id)

    final_count = golem_yard.all.count

    assert_equal 1, (initial_count - final_count)
  end
end
