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
      fill_answers(@homework)       # 填入answer.result
      homework_accuracy(@homework)    # 填入homework.accuracy
      redirect_to task_homework_path(@homework.task_id, @homework.id)
    else
      render 'new'
      flash[:danger] = "Homework save failed."
    end
  end

  def show
    @task = Task.find(params[:task_id])
    @homework = Homework.find(params[:id])
  end

  def result
    @task = Task.find(params[:task_id])
    @homework = Homework.find(params[:id])
  end

  def data
    # @homework = Homework.find(params[:id])
    # data = Hash.new
    # arr = Array.new
    # data[:color] = '#1f77b4'
    # data[:values] = chart_knowledge(@homework)
    # arr << data
    # respond_to do |format|
    #   format.json {
    #     render :json => arr
    #   }
    # end
    respond_to do |format|  # 假数据
      format.json {
        render :json => [{"color":"#1f77b4","values":[{"label":"交换机","value":3},{"label":"无线局域网","value":4},{"label":"虚拟局域网","value":1},{"label":"IP","value":2},{"label":"路由器","value":1}]}]
      }
    end
  end

  private

    def homework_params
      params.require(:homework).permit(:student_id, :task_id, 
          answers_attributes:[:id, :homework_id, :question_no, :content, :answer])
    end
end
