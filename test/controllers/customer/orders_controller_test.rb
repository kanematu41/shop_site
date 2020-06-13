require 'test_helper'

class Customer::OrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customer_orders_index_url
    assert_response :success
  end

  test "should get new" do
    get customer_orders_new_url
    assert_response :success
  end

  test "should get confirm" do
    get customer_orders_confirm_url
    assert_response :success
  end

  test "should get thanks" do
    get customer_orders_thanks_url
    assert_response :success
  end

  test "should get show" do
    get customer_orders_show_url
    assert_response :success
  end

end
