require "application_system_test_case"

class PointTransactionsTest < ApplicationSystemTestCase
  setup do
    @point_transaction = point_transactions(:one)
  end

  test "visiting the index" do
    visit point_transactions_url
    assert_selector "h1", text: "Point transactions"
  end

  test "should create point transaction" do
    visit point_transactions_url
    click_on "New point transaction"

    fill_in "Amount", with: @point_transaction.amount
    fill_in "Description", with: @point_transaction.description
    fill_in "Merchant", with: @point_transaction.merchant_id
    fill_in "Mission", with: @point_transaction.mission_id
    fill_in "Transaction type", with: @point_transaction.transaction_type
    fill_in "User", with: @point_transaction.user_id
    click_on "Create Point transaction"

    assert_text "Point transaction was successfully created"
    click_on "Back"
  end

  test "should update Point transaction" do
    visit point_transaction_url(@point_transaction)
    click_on "Edit this point transaction", match: :first

    fill_in "Amount", with: @point_transaction.amount
    fill_in "Description", with: @point_transaction.description
    fill_in "Merchant", with: @point_transaction.merchant_id
    fill_in "Mission", with: @point_transaction.mission_id
    fill_in "Transaction type", with: @point_transaction.transaction_type
    fill_in "User", with: @point_transaction.user_id
    click_on "Update Point transaction"

    assert_text "Point transaction was successfully updated"
    click_on "Back"
  end

  test "should destroy Point transaction" do
    visit point_transaction_url(@point_transaction)
    click_on "Destroy this point transaction", match: :first

    assert_text "Point transaction was successfully destroyed"
  end
end
