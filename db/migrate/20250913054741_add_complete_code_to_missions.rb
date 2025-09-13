class AddCompleteCodeToMissions < ActiveRecord::Migration[7.1]
  def change
    add_column :missions, :complete_code, :string
    add_index :missions, :complete_code, unique: true
  end
end
