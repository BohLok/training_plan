require 'test_helper'

class TPlanControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get t_plan_show_url
    assert_response :success
  end

end
