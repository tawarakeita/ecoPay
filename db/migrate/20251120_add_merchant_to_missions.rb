class AddMerchantToMissions < ActiveRecord::Migration[7.1]
  def change
    # no-op migration: this slot previously attempted to add merchant_id but
    # the column already exists via another migration. Keep this migration
    # as a placeholder so Rails can mark the version as applied without
    # performing duplicate schema changes.
  end
end
