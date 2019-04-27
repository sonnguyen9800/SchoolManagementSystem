class ApplicationController < ActionController::Base
  before_action :get_data
  def get_data
    @categories = Category.all
    @coordinators = Coordinator.all
    @courses = Course.all
    @locations = Location.all
  end

  include SessionsHelper

end
