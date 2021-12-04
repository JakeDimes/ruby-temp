class CreateGetsAssigneds < ActiveRecord::Migration[6.1]
  def change
    create_table :gets_assigneds do |t|
      t.integer :team_id
      t.integer :eval_id

      t.timestamps
    end
  end
end
