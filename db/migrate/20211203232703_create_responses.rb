class CreateResponses < ActiveRecord::Migration[6.1]
  def change
    create_table :responses do |t|
      t.string :teamname
      t.integer :userID
      t.integer :ratedUserID
      t.integer :rating
      t.string :comment

      t.timestamps
    end
  end
end
