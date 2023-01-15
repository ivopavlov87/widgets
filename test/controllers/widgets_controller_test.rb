require "test_helper"

class WidgetsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get widgets_show_url
    assert_response :success
  end
end
