module TasksHelper
	# 保存Task和题目之后按顺序在TaskChoice中填题号
	def fill_question_no(task)
		task_choices = task.task_choices
		count = task.task_choices.count
		i = 1
		task_choices.each do |task_choice|
			task_choice.question_no = i
			task_choice.save
			i += 1
		end
	end
end
