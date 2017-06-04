module HomeworksHelper
	# 计算正确率并保存在homework.accuracy中
	def homework_accuracy(homework)
		count = homework.answers.count
		count_correct = Answer.where(homework_id: homework.id, result: "1").count
		homework.accuracy = (count_correct.to_f)/(count.to_f)
		homework.save
	end

	# 填入answer.result
	def answer_result(homework)
		task = Task.find(homework.task_id)
		for answer in homework.answers
			task = Task.find(homework.task_id)
			choice = Choice.find(TaskChoice.find_by(task_id: task.id, question_no: answer.question_no).choice_id)
			if choice.answer != answer.content
				answer.result = 0
			elsif choice.answer == answer.content
				answer.result = 1
			end
			answer.save
		end
	end
end
