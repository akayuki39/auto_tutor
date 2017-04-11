class Course < ApplicationRecord
	belongs_to :teacher
	has_many   :enrollments
	has_many   :students, :through => :enrollments
	validates  :teacher_id, presence: true
	validates  :course_number, presence: true
	validates  :course_name, presence: true
	
end
