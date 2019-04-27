module SessionsHelper
  def log_in(coordinator)
    session[:coordinator_id] = coordinator.id
  end

  def current_coordinator
    if session[:coordinator_id]
      @current_coordinator ||= Coordinator.find_by(id: session[:coordinator_id])
    end
  end

  def logged_in?
    !current_coordinator.nil?
  end

  def log_out
    session.delete(:coordinator_id)
    @current_coordinator = nil
  end
end
