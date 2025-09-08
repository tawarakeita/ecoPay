class CreateMissions < ActiveRecord::Migration[7.1]
  def change
    create_table :missions do |t|
      t.references :merchant, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.integer :point

      t.timestamps
    end
  end
end
