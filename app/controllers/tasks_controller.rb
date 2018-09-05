class TasksController < ApplicationController
	def show
		@task = Task.find(params[:id])
	end

	def new
		if teacher?
			@i = 1
			@task = Task.new

			# 3.times { @task.task_choices.build.build_choice }

			# @task_choice = @task.task_choices.build
			# 3.times { @task_choice.choice.build }
			# 3.times { @task.task_choices.build }
			3.times { @task.choices.build }
		else
			redirect_back(fallback_location: "/users")
		end
	end

	def create
		@task = Task.new(task_params)
		if @task.save
			flash[:success] = "Task saved."
			fill_question_no(@task)				# 在这里给中间表中所有对应的task_id记录填入题号
			redirect_to course_task_path(@task.course_id, @task.id)
		else
			render 'new'
			# flash[:danger] = "Task save failed."
		end
	end

	def result
		@task = Task.find(params[:id])
	end

	def data
		respond_to do |format|  # 假数据
			format.json {
				render :json => [{"label":"1","value":13},{"label":"2","value":3},{"label":"3","value":15},{"label":"4","value":20},{"label":"5","value":5},{"label":"6","value":19},{"label":"7","value":16},{"label":"8","value":35}]
			}
		end
	end

	private

  	def task_params
  		params.require(:task).permit(:id, :task_name, :start_time, 
  				:finish_time, :course_id, task_choices_attributes:[:id, 
  				:task_id, :choice_id, :question_no], choices_attributes: 
  				[:id, :question, :a, :b, :c, :d, :teacher_id, :course_id, :answer, :knowledge])
  	end
end
