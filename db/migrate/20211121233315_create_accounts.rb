class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.string :fname
      t.string :lname
      t.integer :dotnum

      t.timestamps
    end
  end
end
