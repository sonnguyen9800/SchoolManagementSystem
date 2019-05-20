module CoursesHelper

  def current_coordinator_owned?
    @course = Course.find(params[:id])
    if logged_in? == false
      flash[:danger] = 'Error'
      redirect_to courses_path
    elsif (logged_in? && current_coordinator == @course.coordinator) || current_coordinator.adminflag == true
      return true
    else
      redirect_to courses_path
    end
  end

end
