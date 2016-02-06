require_relative '../test_helper'

class UserCanEditAnExistingRobot < FeatureTest
  def test_existing_robot_is_updated_with_new_information
    golem_yard.create({ name: "Bob",
                        city: "Detroit"})

    id = golem_yard.all.last.id
    visit "/robots/#{id}/edit"

    fill_in 'robot[name]', with: 'Updated Name'
    fill_in 'robot[city]', with: 'Updated City'
    click_button 'Submit'

    assert_equal "/robots/#{id}", current_path
    within 'h1' do
      assert page.has_content? 'Updated Name'
    end
    within 'p' do
      assert page.has_content? 'Updated City'
    end
  end
end
