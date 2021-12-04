class GetsAssigned < ApplicationRecord
  belongs_to :team
  belongs_to :task

  validates :team_id, presence: true
  validates :eval_id, presence: true
end
