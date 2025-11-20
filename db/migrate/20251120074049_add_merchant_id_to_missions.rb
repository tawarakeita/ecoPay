class AddMerchantIdToMissions < ActiveRecord::Migration[7.1]
  def change
    add_reference :missions, :merchant, null: true, foreign_key: false
  end
end
