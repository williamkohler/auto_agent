require 'test_helper'

class AgentsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get agents_new_url
    assert_response :success
  end

  test "should get create" do
    get agents_create_url
    assert_response :success
  end

end
