class Rating < ApplicationRecord
  #student who is rating id must be an integer and present
  validates :rating_student , presence: true
  #student who is getting rated id must be integer and present
  validates :rated_student, presence: true
  #the rating must be an integer from 0-10
  validates :rating, presence: true, numericality: {only_integer: true, message: "Number must be an Integer from 0-10"}
  #comment must be present
  validates :comment, presence: true
end
