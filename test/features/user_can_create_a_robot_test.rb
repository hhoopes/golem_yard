require_relative '../test_helper'

class UserCanCreateANewRobot < FeatureTest
  def test_robot_creation_with_valid_attributes
    visit '/robots/new'

    fill_in 'robot[name]', with: 'Example robot'
    fill_in 'robot[city]', with: 'Example city'
    fill_in 'robot[state]', with: 'Example state'
    fill_in 'robot[birthdate]', with: '1985-05-23'
    fill_in 'robot[date_hired]', with: '2016-07-22'
    fill_in 'robot[department]', with: 'Sales'
    click_button 'Submit'

    assert_equal '/robots', current_path

    within '.row .robots' do
      assert page.has_content? 'Example robot'
    end
  end
end
