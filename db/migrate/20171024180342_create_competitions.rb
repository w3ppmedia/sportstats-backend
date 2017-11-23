class CreateCompetitions < ActiveRecord::Migration[5.0]
  def up
    create_table :competitions do |t|
      t.string :name
      t.string :flag_url
      t.string :short_name
      t.string :full_name
      t.integer :crowdscore_dbid
      t.integer :region_id
      t.timestamps
    end
  end

  def down
  end
end
