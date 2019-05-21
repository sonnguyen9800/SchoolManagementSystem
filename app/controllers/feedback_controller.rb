class FeedbackController < ApplicationController
  def new
    @feedback = Feedback.new()
  end

  def create
    @feedback = Feedback.new(feedback_params)
    respond_to do |format|
      if @feedback.save
        @sonng_mail = "nguyenhs9800@gmail.com"
        @quocanh_mail = "quocanhdk51@gmail.com"
        ContactMailer.send_feedback(@feedback, @sonng_mail).deliver_now()
        ContactMailer.send_feedback(@feedback, @quocanh_mail).deliver_now()
        format.html { redirect_to root_path}
        format.json { render :show, status: :created, feedback: @feedback }
        @feedback.destroy
      else
        format.html { render :new }
        format.json { render json: @feedback.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy

  end

  def feedback_params
        params.require(:feedback).permit(:subject, :content)
  end
end
