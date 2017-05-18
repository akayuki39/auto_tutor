class Choice < ApplicationRecord
	belongs_to :course
	belongs_to :teacher
	has_many   :task_choices
	has_many   :tasks, :through => :task_choices
	# validates  :teacher_id, presence: true
	# validates  :course_id,  presence: true
end
