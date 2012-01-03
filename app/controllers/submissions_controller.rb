class SubmissionsController < ApplicationController
  
  before_filter :authenticate_designer!
  
  def create
    @project = Project.find(params[:project_id])
    @submission = @project.submissions.new(params[:submission])
    
    respond_to do |format|
      if @submission.save
        format.html { redirect_to @project, notice: 'Your logo was successfully submitted.' }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end
  
end
