class Task < ApplicationRecord
	belongs_to :course
	has_many   :task_choices, inverse_of: :task
	has_many   :choices, :through => :task_choices
	# accepts_nested_attributes_for :task_choices, :reject_if => :all_blank
	accepts_nested_attributes_for :choices, :reject_if => lambda { |a| a[:question].blank? }, :allow_destroy => true
	validates  :start_time,  presence: true
	validates  :finish_time, presence: true
	validates  :course_id,   presence: true
end
