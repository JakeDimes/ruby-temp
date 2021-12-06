class RemoveRatingStudentToTasks < ActiveRecord::Migration[6.1]
  def change
    remove_column :tasks, :rating_student, :string
  end
end
