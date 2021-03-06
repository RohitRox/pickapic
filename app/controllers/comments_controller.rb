class CommentsController < ApplicationController

  include ApplicationHelper
  before_filter :authenticate_access
  before_filter :get_messages, :get_user_prestige
  before_filter :auth_private_projects, :only => [:index]

  def index
    @submission = Submission.find(params[:submission_id])
    @comments = @submission.comments.all
  end


  def create
    @submission = Submission.find(params[:submission_id])
    @comment = @submission.comments.new(params[:comment])
    @comment.employer = current_employer if employer_signed_in?
    @comment.designer = current_designer if designer_signed_in?
    if @submission.designer == current_designer
      @submission.project.employer.messages.create(:content=>"Your have a back comment for <a href='"+ submission_comments_path(@submission) +"'>"+@submission.project.title+"</a>")
    elsif @submission.project.employer == current_employer
      @submission.designer.messages.create(:content=>"Your work has been reviewed and commented for <a href='"+ submission_comments_path(@submission) +"'>"+@submission.project.title+"</a>")
    end
    respond_to do |format|
      if @comment.save
        format.html { redirect_to submission_comments_path(@submission) }
      else
        format.html { redirect_to submission_comments_path(@submission), alert: 'File was either empty or not supported format !'  }
      end
    end
  end
  
  private
  
  def auth_private_projects
    @submission = Submission.find(params[:submission_id])
    if @submission.project.project_type == "public" || (@submission.project.project_type == "private" && (@submission.project.employer == current_employer || @submission.designer == current_designer))
      true
    else
       redirect_to project_path(@submission.project), alert: 'Sorry this is the private project'
    end
    
  end


end
