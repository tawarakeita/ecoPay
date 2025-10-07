class AddMunicipalityIdToMerchants < ActiveRecord::Migration[7.1]
  def change
    add_column :merchants, :municipality_id, :integer
  end
end
