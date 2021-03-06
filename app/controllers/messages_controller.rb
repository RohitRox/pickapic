class MessagesController < ApplicationController

  include ApplicationHelper
  before_filter :authenticate_access
  before_filter :get_messages, :get_user_prestige

  def index
  if designer_signed_in?
   @messages = current_designer.messages.order("id DESC").where(:state => false)
   @messages.each do |m|
         m.state=true
         m.save
        end
  elsif employer_signed_in?
    @messages = current_employer.messages.order("id DESC").where(:state => false)
    @messages.each do |m|
      m.state=true
      m.save
     end
  else
    redirect_to root_path
  end
  end
  
  def show_all
    if designer_signed_in?
     @messages = current_designer.messages.order("id DESC")
     
    elsif employer_signed_in?
      @messages = current_employer.messages.order("id DESC")
    
    else
      redirect_to root_path
    end
  end


end

