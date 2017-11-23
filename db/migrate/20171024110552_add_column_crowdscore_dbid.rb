class AddColumnCrowdscoreDbid < ActiveRecord::Migration[5.0]
  def up
    add_column :teams, :crowdscore_dbid, :integer
  end

  def down
  end
end
