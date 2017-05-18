class TasksController < ApplicationController
	def show
		@task = Task.find(params[:id])
	end

	def new
		if teacher?
			@task = Task.new
			3.times { @task.choices.build }
		else
			redirect_back(fallback_location: "/users")
		end
	end

	def create
		@task = Task.new(task_params)
		if @task.save
			flash[:success] = "Task saved."
			redirect_to course_task_path(@task.course_id, @task.id)
		else
			render 'new'
		end
	end

	private

  	def task_params
  		params.require(:task).permit(:id, :task_name, :start_time, :finish_time, :course_id, task_choices_attributes:[:id, :task_id, :choice_id], choices_attributes:[:id, :question, :a, :b, :c, :d, :teacher_id, :course_id])
  	end
end
