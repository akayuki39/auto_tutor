class AddQuestionNoToTaskChoices < ActiveRecord::Migration[5.0]
  def change
  	add_column :task_choices, :question_no, :integer
  end
end
