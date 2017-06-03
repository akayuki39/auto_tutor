class Answer < ApplicationRecord
	belongs_to :homework, optional: true
end
