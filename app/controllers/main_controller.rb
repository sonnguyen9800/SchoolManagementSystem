class MainController < ApplicationController
  #before_action :logged_in_coordinator, only: [:home, :help]
  def home
    if logged_in?
      redirect_to courses_path
    end
  end
  def error

  end
  def help
  end
end
