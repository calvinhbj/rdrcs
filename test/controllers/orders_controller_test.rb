require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post :create, order: { code: @order.code, description: @order.description, mb_id: @order.mb_id, order_status: @order.order_status, pay_status: @order.pay_status, pay_type: @order.pay_type, pd_id: @order.pd_id, price: @order.price, service_status: @order.service_status }
    end

    assert_redirected_to order_path(assigns(:order))
  end

  test "should show order" do
    get :show, id: @order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @order
    assert_response :success
  end

  test "should update order" do
    patch :update, id: @order, order: { code: @order.code, description: @order.description, mb_id: @order.mb_id, order_status: @order.order_status, pay_status: @order.pay_status, pay_type: @order.pay_type, pd_id: @order.pd_id, price: @order.price, service_status: @order.service_status }
    assert_redirected_to order_path(assigns(:order))
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete :destroy, id: @order
    end

    assert_redirected_to orders_path
  end
end
