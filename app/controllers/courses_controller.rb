class CoursesController < ApplicationController
	def index
	end

	def new
	end

	def show
		@course = Course.find(params[:id])
		@tasks = @course.tasks.find_all
	end
end
