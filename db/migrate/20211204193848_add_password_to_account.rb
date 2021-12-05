class AddPasswordToAccount < ActiveRecord::Migration[6.1]
  def change
    add_column :accounts, :password, :string
  end
end
