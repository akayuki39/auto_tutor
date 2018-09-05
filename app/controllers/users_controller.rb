class UsersController < ApplicationController
  def index
    @user = current_user
    @courses = @user.courses
  end

  def show
    # @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to AutoTutor!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :no, :type, :password, :password_comfirmation)
    end
end
