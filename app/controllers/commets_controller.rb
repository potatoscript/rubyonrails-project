class CommetsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_job

    def create
        @comment = @job.comments.create(comment_params)
        @comment.user = current_user

        if @comment.save
            flash[:notice] = "Comment has been created"
            redirect_to job_path(@job)
        else
            flash[:alert] = "Comment has not been created"
            redirect_to job_path(@job)
        end
    end

    def destroy
        @comment = @job.comments.find(params[:id])
        @commment.destroy
        redirect_to job_path(@job)
    end

    private

    def set_job
        @job = Job.find(params[:job_id])
    end

    def comment_params
        params.requiire(:comment).permit(:body)
    end

end
