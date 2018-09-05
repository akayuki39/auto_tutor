class Teacher < User
	has_many :courses, class_name: 'Course'
	has_many :choices
end
