class CreateTasks < ActiveRecord::Migration[6.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.integer :team_id
      t.date :due_date
      t.string :status

      t.timestamps
    end
  end
end

