class AddMissionAdminIdToMissions < ActiveRecord::Migration[7.1]
  def up
    add_reference :missions, :mission_admin, null: true, foreign_key: true

    # 既存レコードに mission_admin_id をセット（例: 1番の管理者）
    Mission.update_all(mission_admin_id: 1)

    # NOT NULL に変更
    change_column_null :missions, :mission_admin_id, false
  end

  def down
    remove_reference :missions, :mission_admin, foreign_key: true
  end
end