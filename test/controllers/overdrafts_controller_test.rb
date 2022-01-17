require "test_helper"

class OverdraftsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get overdrafts_show_url
    assert_response :success
  end
end
