module UpvotesHelper
  def vote_status
    if Upvote.where(coordinator_id: current_coordinator.id, course_id:params[:course_id]).exists?
        return 1
    elsif Downvote.where(coordinator_id: current_coordinator.id, course_id:params[:course_id]).exists?
        return -1
    else return 0
      end
  end
end
