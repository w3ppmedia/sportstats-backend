class ChangeDataTypeForTeamNational < ActiveRecord::Migration[5.0]
  def up
    change_table :teams do |t|
      t.change :national, :integer, :limit => 4
    end
  end

  def down
  end
end
