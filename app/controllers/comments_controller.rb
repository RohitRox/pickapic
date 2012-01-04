class CommentsController < ApplicationController
  
  include ApplicationHelper
  before_filter :authenticate_employer!, :except=>[:index]
  before_filter :get_messages
  
  def index
  @submission = Submission.find(params[:submission_id])
  @comments = @submission.comments.all
  end
  
  
  def create
     @submission = Submission.find(params[:submission_id])
     @comment = @submission.comments.new(params[:comment])
     @comment.employer = current_employer
     
     respond_to do |format|
       if @comment.save
        @submission.designer.messages.create(:content=>"Your work has been reviewed and commented for <a href='"+ submission_comments_path(@submission) +"'>"+@submission.project.title+"</a>")
         format.html { redirect_to submission_comments_path(@submission) }
       else
         format.html { redirect_to submission_comments_path(@submission), alert: 'File was either empty or not supported format !'  }
       end
     end
   end
  
  
end
