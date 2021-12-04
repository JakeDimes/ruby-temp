class CreateRatings < ActiveRecord::Migration[6.1]
  def change
    create_table :ratings do |t|
      t.integer :eval_id
      t.string :rating_student
      t.string :rated_student
      t.integer :rating
      t.string :comment

      t.timestamps
    end
  end
end
