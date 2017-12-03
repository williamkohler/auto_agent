require 'test_helper'

class ShowsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get shows_new_url
    assert_response :success
  end

end
