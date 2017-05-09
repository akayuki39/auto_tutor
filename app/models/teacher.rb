class Teacher < User
	has_many :courses, class_name: 'Course'
end
