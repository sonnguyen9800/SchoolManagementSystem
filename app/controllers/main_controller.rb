class MainController < ApplicationController
  #before_action :logged_in_coordinator, only: [:home, :help]
  def home
    if logged_in?
      redirect_to courses_path
    end
  end
  def error404
    @text = '404'
    render '/main/error.html.erb'
  end

  def error422
    @text = '422'
    render '/main/error.html.erb'
  end

  def error500
    @text = '500'
    render '/main/error.html.erb'
  end

  def help
  end
end
