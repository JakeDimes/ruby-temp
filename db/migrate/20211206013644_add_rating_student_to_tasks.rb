class AddRatingStudentToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :rating_student, :string
  end
end
