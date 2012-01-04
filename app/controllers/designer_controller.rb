class DesignerController < ActionController::Base

include ApplicationHelper
before_filter :authenticate_designer! 
before_filter :get_messages

layout "application"

def index
@projects=Project.all
@messages_num = current_designer.messages.where(:state => false).size
end

end