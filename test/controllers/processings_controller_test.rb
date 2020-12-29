require 'test_helper'

class ProcessingsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get processings_show_url
    assert_response :success
  end

end
