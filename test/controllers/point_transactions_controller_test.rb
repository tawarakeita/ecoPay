require "test_helper"

class PointTransactionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @point_transaction = point_transactions(:one)
  end

  test "should get index" do
    get point_transactions_url
    assert_response :success
  end

  test "should get new" do
    get new_point_transaction_url
    assert_response :success
  end

  test "should create point_transaction" do
    assert_difference("PointTransaction.count") do
      post point_transactions_url, params: { point_transaction: { amount: @point_transaction.amount, description: @point_transaction.description, merchant_id: @point_transaction.merchant_id, mission_id: @point_transaction.mission_id, transaction_type: @point_transaction.transaction_type, user_id: @point_transaction.user_id } }
    end

    assert_redirected_to point_transaction_url(PointTransaction.last)
  end

  test "should show point_transaction" do
    get point_transaction_url(@point_transaction)
    assert_response :success
  end

  test "should get edit" do
    get edit_point_transaction_url(@point_transaction)
    assert_response :success
  end

  test "should update point_transaction" do
    patch point_transaction_url(@point_transaction), params: { point_transaction: { amount: @point_transaction.amount, description: @point_transaction.description, merchant_id: @point_transaction.merchant_id, mission_id: @point_transaction.mission_id, transaction_type: @point_transaction.transaction_type, user_id: @point_transaction.user_id } }
    assert_redirected_to point_transaction_url(@point_transaction)
  end

  test "should destroy point_transaction" do
    assert_difference("PointTransaction.count", -1) do
      delete point_transaction_url(@point_transaction)
    end

    assert_redirected_to point_transactions_url
  end
end
