class HomeController < ActionController::Base

  layout "application"

  def index

    if employer_signed_in?
      redirect_to employer_root_path
    elsif designer_signed_in?
      redirect_to designer_root_path
    end

  end

end
