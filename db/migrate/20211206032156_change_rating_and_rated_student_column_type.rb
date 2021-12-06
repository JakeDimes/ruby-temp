class ChangeRatingAndRatedStudentColumnType < ActiveRecord::Migration[6.1]
  def change
    change_column :ratings, :rating_student, :integer
    change_column :ratings, :rated_student, :integer
  end
end
