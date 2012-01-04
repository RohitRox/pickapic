class SubmissionsController < ApplicationController
  
  before_filter :authenticate_designer!
  
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
  
end
