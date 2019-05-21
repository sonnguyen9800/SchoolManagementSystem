class CoordinatorsController < ApplicationController
  before_action :set_coordinator, only: [:show, :edit, :update, :destroy]
  before_action :logged_in_coordinator, only: [:edit, :update]
  before_action :correct_coordinator, only: [:edit, :update]
  before_action :logged_in_admin, only: [:detroy, :edit, :update]

  # GET /coordinators
  # GET /coordinators.json
  def index
    @coordinators = Coordinator.all
  end

  # GET /coordinators/1
  # GET /coordinators/1.json
  def show
    if @coordinator.adminflag == true
      flash[:success] = "You cannot see the admmin"
      redirect_to courses_path
    else
    @coordinator = Coordinator.find(params[:id])
    @courses = @coordinator.courses
  end
  end

  # GET /coordinators/new
  def new
    @coordinator = Coordinator.new
  end

  # GET /coordinators/1/edit
  def edit
    if @coordinator.adminflag == true
      flash[:success] = "You cannot edit admin"
      redirect_to courses_path
    else
    @coordinator = Coordinator.find(params[:id])
    end
  end

  # POST /coordinators
  # POST /coordinators.json

  def create
    @coordinator = Coordinator.new(coordinator_params)
    if @coordinator.save
      log_in @coordinator
      flash[:success] = "Welcome to the system!"
      redirect_to courses_path
    else
      render 'new'
    end
  end

  # PATCH/PUT /coordinators/1
  # PATCH/PUT /coordinators/1.json
  def update
      @coordinator = Coordinator.find(params[:id])
      if @coordinator.update_attributes(coordinator_params)
        # Handle a successful update.
        flash[:success] = "You just updated a coordinator"
        redirect_to coordinator_path(@coordinator)
      else
        redirect_to coordinator_path(@coordinator)
      end
    end
  # DELETE /coordinators/1
  # DELETE /coordinators/1.json
  def destroy
    @coordinator.destroy
    respond_to do |format|
      flash[:success] = "You just remove a coordinator"
      format.html { redirect_to coordinators_url}
      format.json { head :no_content }
    end
  end


  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def set_coordinator
      @coordinator = Coordinator.find(params[:id])
    end

    def coordinator_params
      params.require(:coordinator).permit(:name, :email, :password, :password_confirmation)
    end

      #Confirm the users
     def correct_coordinator
         @coordinator = Coordinator.find(params[:id])
         if current_coordinator.adminflag == true
           return true
         end

         if !logged_in?
           redirect_to(root_url)
           flash[:danger] = "Please Log in First"
         end

         if current_coordinator?(@coordinator) == false && logged_in?
           redirect_to(root_url)
           flash[:danger] = "You don't have the permission to access"
         end
     end

     def current_coordinator_admin?
       return true if current_coordinator.adminflag == true
       return false
     end
end
