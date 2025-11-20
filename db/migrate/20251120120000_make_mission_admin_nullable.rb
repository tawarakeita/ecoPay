class MakeMissionAdminNullable < ActiveRecord::Migration[7.1]
  def change
    # Allow missions to exist without a mission_admin. Column may already be
    # nullable in some environments; guard against exceptions.
    if column_exists?(:missions, :mission_admin_id)
      change_column_null :missions, :mission_admin_id, true
    end
  end
end
