class TaskChoice < ApplicationRecord
  belongs_to :task
  belongs_to :choice
  # accepts_nested_attributes_for :choice, :reject_if => lambda { |a| a[:question].blank? }, :allow_destroy => true
  validates  :task_id,  presence: true
end
