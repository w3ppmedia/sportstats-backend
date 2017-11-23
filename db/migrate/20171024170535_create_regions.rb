class CreateRegions < ActiveRecord::Migration[5.0]
  def up
    create_table :regions do |t|
      t.string :name
      t.integer :region_group_id
      t.integer :crowdscore_dbid
      t.string :flag_url
      t.timestamps
    end

    add_index(:regions, :crowdscore_dbid, unique: true)
  end

  def down
  end
end
