class SubmissionsController < ApplicationController
  
  before_filter :authenticate_designer!,:except=>[:rating]
  
  def create
    @project = Project.find(params[:project_id])
    @submission = @project.submissions.new(params[:submission])
    
    respond_to do |format|
      if @submission.save
        format.html { redirect_to @project, notice: 'Your logo was successfully submitted.' }
      else
        format.html { redirect_to @project, alert: 'File was either empty or not supported format !'  }
      end
    end
  end
  
  def rating
    @submitted = Submission.find(params[:submission_id])
    @project = @submitted.project
    if @project.employer == current_employer
        @submission = @project.submissions.find(params[:submission_id])
        @submission.rating = params[:rate_id]
        @submission.save
    end
  end
  
end
