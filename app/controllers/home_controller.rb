class HomeController < ActionController::Base

  layout "application"

  def index

    if employer_signed_in?
      redirect_to employer_root_path
    elsif designer_signed_in?
      redirect_to designer_root_path
    else
      @rewarded_submission = Submission.where(:approve => true)
      @designers = Designer.all.size
      @open_project = Project.where(:status => "open")
      @projects = Project.where(:status => "Rewarded")
      @payout = get_total_offer(@projects)
      @open_project_size = @open_project.size
      @total_open_offer = get_total_offer(@open_project)
    end
  end
  
  private
  def get_total_offer(open_project)
    price = 0.0
    open_project.each do |op|
      price += op.budget
    end
    price
  end

end
