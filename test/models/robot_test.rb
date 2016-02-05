require_relative '../test_helper'

class RobotTest < Minitest::Test
  def test_robot_attributes_assigned_correctly
    data = {
      :id           => 1,
      :name         => "robot",
      :city         => "something"
    }

    robot = Robot.new(data)

    assert_equal 1, robot.id
    assert_equal "robot", robot.name
    assert_equal "something", robot.city
  end
end
