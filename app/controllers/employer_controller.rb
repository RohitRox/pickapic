class EmployerController < ActionController::Base
  include ApplicationHelper
  before_filter :authenticate_access
  before_filter :authenticate_employer!, :get_messages, :get_user_prestige, :update_project_status
  layout "application"

  def index
    @projects = current_employer.projects
    @project = Project.new
    @messages_num = current_employer.messages.where(:state => false).size
  end

end