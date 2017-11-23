class CreateRegionGroups < ActiveRecord::Migration[5.0]
  def up
    create_table :region_groups do |t|
      t.string :name
      t.integer :region_group_id
      t.integer :crowdscore_dbid
      t.string :flag_url
      t.timestamps
    end

    add_index(:region_groups, :crowdscore_dbid, unique: true)
  end
end
