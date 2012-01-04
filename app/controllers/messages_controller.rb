class MessagesController < ApplicationController
  
  include ApplicationHelper
  before_filter :get_messages
  
  def index
  if designer_signed_in?
   @messages = current_designer.messages
   @messages.each do |m|
    m.state=true
    m.save
   end
  elsif employer_signed_in?
    @messages = current_employer.messages
    @messages.each do |m|
      m.state=true
      m.save
     end
  else
    redirect_to root_path
  end
  end
  
  
end
