class Task < ApplicationRecord
  has_many :accounts
  has_many :teams, through: :gets_assigned

  validates :name, presence: true
  validates :team_id, presence: true
  validates :due_date, presence: true
  validates :status, presence: true
end
