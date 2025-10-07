class ChangeMissionIdNullableInPointTransactions < ActiveRecord::Migration[7.1]
  def change
    change_column_null :point_transactions, :mission_id, true
  end
end
