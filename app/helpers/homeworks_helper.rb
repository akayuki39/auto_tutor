module HomeworksHelper
	# 计算正确率并保存在homework.accuracy中
	def homework_accuracy(homework)
		count = homework.answers.count
		count_correct = Answer.where(homework_id: homework.id, result: "1").count
		homework.accuracy = (count_correct.to_f)/(count.to_f)
		homework.save
	end

	# 填入answer.result以及knowledge
	def fill_answers(homework)
		task = Task.find(homework.task_id)
		for answer in homework.answers
			task = Task.find(homework.task_id)
			choice = Choice.find(TaskChoice.find_by(task_id: task.id, question_no: answer.question_no).choice_id)
			if choice.answer != answer.content
				answer.result = 0
			elsif choice.answer == answer.content
				answer.result = 1
			end
			answer.knowledge = choice.knowledge
			answer.save
		end
	end

	# 输出各个知识点错误数量
	def chart_knowledge(homework)
		# { 
		# 	"label" : "Group A" ,
		# 	"value" : -1.8746444827653
		# } , 
		# { 
		# 	"label" : "Group B" ,
		# 	"value" : -8.0961543492239
		# }
		wrong_answers = Answer.where(homework_id: homework.id, result: "0")
		arr = Array.new(0)
		h = Hash.new(0)    # new(0)必须存在

		wrong_answers.each do |answer|		#=> { knowledge1: count, knowledge2: count }
			h[answer.knowledge] += 1
		end

		h.each do |k, v|
			hash = Hash.new
			hash[:label] = k
			hash[:value] = v
			arr << hash
		end

		arr
	end
end
