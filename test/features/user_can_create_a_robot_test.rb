require_relative '../test_helper'

class UserCanCreateANewRobot < FeatureTest
  def test_robot_creation_with_valid_attributes
    visit '/robots/new'

    fill_in 'robot[name]', with: 'Example robot'
    fill_in 'robot[city]', with: 'Example city'
    click_button 'Submit'

    assert_equal '/robots', current_path

    within '#robots' do
      assert page.has_content? 'Example robot'
    end
  end
end
