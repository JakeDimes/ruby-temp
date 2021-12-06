class Team < ApplicationRecord
  validates :name, presence: true
  validates :count, presence: true, numericality: {only_integer: true, other_than: 0, message: "Number of accounts in the team cannot be zero!"}

  has_many :accounts

  has_many :gets_assigneds
  has_many :tasks, through: :gets_assigneds
end
