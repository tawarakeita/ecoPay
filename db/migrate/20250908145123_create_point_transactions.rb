class CreatePointTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :point_transactions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :merchant, null: false, foreign_key: true
      t.string :transaction_type
      t.integer :amount
      t.references :mission, null: false, foreign_key: true
      t.string :description

      t.timestamps
    end
  end
end
