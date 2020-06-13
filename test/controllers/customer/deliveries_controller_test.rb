require 'test_helper'

class Customer::DeliveriesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customer_deliveries_index_url
    assert_response :success
  end

  test "should get edit" do
    get customer_deliveries_edit_url
    assert_response :success
  end

end
