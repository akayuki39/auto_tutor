class Homework < ApplicationRecord
	belongs_to :task
	belongs_to :student
	has_many   :answers
end
