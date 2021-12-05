class AddEvalIdToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :eval_id, :integer
  end
end
