class Homework < ApplicationRecord
  belongs_to :task
  belongs_to :student
  has_many   :answers
  accepts_nested_attributes_for :answers, :reject_if => lambda { |a| a[:content].blank? }, :allow_destroy => true
end
