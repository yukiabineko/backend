require 'test_helper'

class ShoppingPhoneControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get shopping_phone_create_url
    assert_response :success
  end

end
