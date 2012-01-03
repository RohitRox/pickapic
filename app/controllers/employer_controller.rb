class EmployerController < ActionController::Base

before_filter :authenticate_employer!

layout "application"

def index
@projects = current_employer.projects
@project = Project.new
end

end