class RemovePasswordFromAccount < ActiveRecord::Migration[6.1]
  def change
    remove_column :accounts, :password
  end
end
