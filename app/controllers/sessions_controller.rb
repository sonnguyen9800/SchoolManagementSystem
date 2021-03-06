class SessionsController < ApplicationController
  def new
  end

  def create
    coordinator = Coordinator.find_by(email: params[:session][:email].downcase)
    if coordinator && coordinator.authenticate(params[:session][:password])
      # Log the user in and redirect to the user's show page.
      flash[:success] = 'Login Successfully' 
      log_in coordinator
      params[:session][:remember_me] == '1' ? remember(coordinator) : forget(coordinator)
      redirect_back_or courses_path
    else
      # Create an error message.
      flash[:danger] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
      flash[:danger] = 'You logged out'
      redirect_to root_path
  end
end
