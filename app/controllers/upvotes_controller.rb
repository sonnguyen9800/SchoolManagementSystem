class UpvotesController < ApplicationController
  include DownvotesHelper
  before_action :find_course

  def create
   if vote_status == 0 #no vote
     start_upvote
     redirect_to courses_path
   elsif vote_status == -1
     start_upvote
     delete_downvote
     redirect_to courses_path

   elsif vote_status == 1
     delete_upvote
     redirect_to courses_path

   end
  end

  private
    def find_course
     @course = Course.find(params[:course_id])
    end

    def start_upvote
      @course.upvotes.create(coordinator_id: current_coordinator.id)
    end

    def delete_downvote
      Downvote.where(coordinator_id: current_coordinator.id, course_id:params[:course_id]).destroy_all
    end

    def delete_upvote
      Upvote.where(coordinator_id: current_coordinator.id, course_id:params[:course_id]).destroy_all
    end
end
