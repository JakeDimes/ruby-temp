class AddTeamIdToAccount < ActiveRecord::Migration[6.1]
  def change
    add_column :accounts, :team_id, :integer
  end
end
