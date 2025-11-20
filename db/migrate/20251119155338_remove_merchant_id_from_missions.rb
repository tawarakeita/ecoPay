class RemoveMerchantIdFromMissions < ActiveRecord::Migration[7.1]
  def change
    if foreign_key_exists?(:missions, :merchants)
      remove_foreign_key :missions, :merchants
    end

    if index_exists?(:missions, :merchant_id)
      remove_index :missions, :merchant_id
    end

    if column_exists?(:missions, :merchant_id)
      remove_column :missions, :merchant_id
    end
  end
end