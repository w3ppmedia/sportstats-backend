class AddColumnShortCode < ActiveRecord::Migration[5.0]
  def up
    add_column :teams, :short_code, :integer, after: :short_name
  end

  def down
  end
end
