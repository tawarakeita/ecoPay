class ChangeCloumnsNotnullRemoveMissions < ActiveRecord::Migration[7.1]
  def change
    change_column_null :missions, :mission_admin_id, true
  end
end
