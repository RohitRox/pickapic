class DesignerController < ActionController::Base

before_filter :authenticate_designer!

layout "application"

def index
@projects=Project.all
end

end