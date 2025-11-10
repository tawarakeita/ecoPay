class RenameCompleteCodeColumnToMissions < ActiveRecord::Migration[7.1]
  def change
    rename_column :missions, :unique_code, :unique_code
  end
end
