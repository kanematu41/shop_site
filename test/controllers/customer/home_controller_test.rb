require 'test_helper'

class Customer::HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get customer_home_top_url
    assert_response :success
  end

end
