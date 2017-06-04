class HomeworksController < ApplicationController
	def new
		if !(homework = Homework.find_by(task_id: params[:task_id], student_id: current_user.id))
			@user = current_user
			@homework = Homework.new
			@task = Task.find(params[:task_id])
			@task.choices.count.times { @homework.answers.build }
		else
			redirect_to task_homework_path(homework.task_id, homework.id)
		end
	end

	def create
		@homework = Homework.new(homework_params)
		if @homework.save!
			flash[:success] = "Homework saved."
			answer_result(@homework)				# 填入answer.result
			homework_accuracy(@homework)		# 填入homework.accuracy
			redirect_to task_homework_path(@homework.task_id, @homework.id)
		else
			# render 'new'
			flash[:danger] = "Homework save failed."
		end
	end

	def show
		@task = Task.find(params[:task_id])
		@homework = Homework.find(params[:id])
	end

	private

		def homework_params
			params.require(:homework).permit(:student_id, :task_id, 
					answers_attributes:[:id, :homework_id, :question_no, :content])
		end
end
