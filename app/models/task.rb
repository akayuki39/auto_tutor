class Task < ApplicationRecord
	belongs_to :course
	validates  :start_time,  presence: true
	validates  :finish_time, presence: true
	validates  :course_id,   presence: true
end
