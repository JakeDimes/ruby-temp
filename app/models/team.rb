class Team < ApplicationRecord
  has_many :accounts

  has_many :gets_assigneds
  has_many :tasks, through: :gets_assigneds
end
