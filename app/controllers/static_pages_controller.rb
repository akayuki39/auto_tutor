class StaticPagesController < ApplicationController
  def home
  	# if !logged_in?
  	# 	redirect_to login_path
  	# else
  		render 'home'
  	# end
  end
end
