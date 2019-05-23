class CoursesController < ApplicationController
  include SessionsHelper
  include CoursesHelper
  before_action :set_course, only: [:show, :edit, :update, :destroy, :reset_vote]
  before_action :logged_in_admin, only: [:detroy, :reset_vote]
  before_action :current_coordinator_owned?, only: [ :edit, :update]
  before_action :logged_in_coordinator, only: [:create]
  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all
  end
  # GET /courses/1
  # GET /courses/1.json
  def show
    @course =  Course.find(params[:id])

  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to @course }
        flash[:success] = @course.name + " has been created"
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course }
        flash[:success] = "Course has been updated"
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      flash[:success] = "You just remove a course"
      format.html { redirect_to courses_url}
      format.json { head :no_content }
    end
  end

  def thumpUp
    like += 1
  end

  def thumpDown
    dislike -= 1
  end

  def reset_vote
    @course.upvotes.destroy_all
    @course.downvotes.destroy_all
    redirect_to courses_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:course).permit(:name, :prerequisite, :description, :coordinator_id,  :image, { category_ids:[] }, {location_ids:[] })
    end

end
