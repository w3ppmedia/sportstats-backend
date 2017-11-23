class AddIndexToColumn < ActiveRecord::Migration[5.0]
  def up
    add_index(:teams, :crowdscore_dbid, unique: true)
  end

  def down
  end
end
