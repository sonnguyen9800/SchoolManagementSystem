class ApplicationController < ActionController::Base
  before_action :get_data
  def get_data
    @categories = Category.all
    @coordinators = Coordinator.all
    @courses = Course.all
    @locations = Location.all
  end

  include SessionsHelper

  private
  def logged_in_coordinator
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
  def logged_in_admin
    unless logged_in? && current_coordinator.adminflag == true
      flash[:danger] = "You are not admin"
      redirect_to courses_path
    end
  end
end
