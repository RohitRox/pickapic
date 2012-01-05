class DesignerController < ActionController::Base

include ApplicationHelper
before_filter :authenticate_designer! 
before_filter :get_messages, :get_user_prestige, :update_project_status

layout "application"

def index
@projects=Project.where(:status=>"open")
@messages_num = current_designer.messages.where(:state => false).size
@mydesigns = current_designer.submissions
end

end