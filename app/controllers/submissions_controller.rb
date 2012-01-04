class SubmissionsController < ApplicationController

  include ApplicationHelper
  before_filter :authenticate_designer!,:except=>[:rating, :reward]
  before_filter :get_messages

  def create
    @project = Project.find(params[:project_id])
    @submission = @project.submissions.new(params[:submission])
    @submission.designer = current_designer
    respond_to do |format|
      if @submission.save
        @project.employer.messages.create(:content=>"1 new Logo Submitted For Your Project: <a href='"+ project_path(@project) +"'>"+@project.title+"</a>")
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
        @designer = @submission.designer
        @designer.messages.create(:content=>"Your work has been rated a "+@submission.rating.to_s+" Star for <a href='"+ project_path(@project) +"'>"+@project.title+"</a>")
    end
  end

  def reward
      @submission = Submission.find(params[:submission_id])
    if @submission.project.employer == current_employer
    @submission.project.status = "Rewarded"
    @submission.approve = 1
    @submission.designer.earning += @submission.project.budget
    @submission.project.employer.credit -= @submission.project.budget
    @project=@submission.project
    @submission.designer.messages.create(:content=>"Congratulation ! Your work for <a href='"+ project_path(@project) +"'>"+@project.title+"</a> has been approved. You have been rewarded"+@submission.project.budget .to_s)
    @submission.project.save
    @submission.designer.save
    @submission.project.employer.save
    @notice='The Design Has Been Rewarded and The Project has been closed !'
    respond_to do |format|
      format.html { redirect_to submission_comments_path(@submission), notice: @notice  }
      format.js
    end
  else
    @notice='You are not authorized !'
    respond_to do |format|
      format.html { redirect_to submission_comments_path(@submission), notice: @notice  }
      format.js
    end
  end

  end

end

