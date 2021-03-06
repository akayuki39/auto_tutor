class Student < User
  has_many :homeworks
  has_many :enrollments
  has_many :courses, :through => :enrollments, :source => :course
end
