require_relative '../test_helper'

class UserCanDeleteAnExistingRobotTest < FeatureTest
  def test_existing_robot_is_deleted_successfully
    golem_yard.create({
      name: "Original Name",
      city: 'Original City'
    })

    visit '/robots'

    assert page.has_content? 'Original Name'

    click_button 'Delete'

    within '#robots' do
      refute page.has_content? 'Original City'
    end
  end
end
