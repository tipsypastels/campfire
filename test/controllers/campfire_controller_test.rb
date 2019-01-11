require 'test_helper'

class CampfireControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get campfire_index_url
    assert_response :success
  end

end
