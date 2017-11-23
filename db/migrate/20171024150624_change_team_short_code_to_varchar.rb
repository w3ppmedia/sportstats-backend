class ChangeTeamShortCodeToVarchar < ActiveRecord::Migration[5.0]
  def change
    change_table :teams do |t|
      t.change :short_code, :string
    end
  end
end
