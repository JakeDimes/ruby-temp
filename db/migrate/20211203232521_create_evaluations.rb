class CreateEvaluations < ActiveRecord::Migration[6.1]
  def change
    create_table :evaluations do |t|
      t.string :team
      t.string :name
      t.integer :evalID

      t.timestamps
    end
  end
end
