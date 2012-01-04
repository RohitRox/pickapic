class CommentsController < ApplicationController
  
  
  before_filter :authenticate_employer!, :except=>[:index]
  
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
         format.html { redirect_to submission_comments_path(@submission) }
       else
         format.html { redirect_to submission_comments_path(@submission), alert: 'File was either empty or not supported format !'  }
       end
     end
   end
  
  
end
