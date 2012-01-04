module ApplicationHelper
  
  def get_messages
    @user = current_employer if employer_signed_in?
    @user = current_designer if designer_signed_in?
    @message_number = @user.messages.where(:state => false).size if (employer_signed_in? || designer_signed_in?) 
  end
end
