class AddNameToMissionAdmins < ActiveRecord::Migration[7.1]
  def change
    add_column :mission_admins, :name, :string
  end
end
