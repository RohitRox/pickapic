module ApplicationHelper
  
  def authenticate_access
  if employer_signed_in? || designer_signed_in?
  else
    redirect_to root_path, :notice=>"You need to sign in to access."
  end
  end
  
  def get_messages
    get_user
    @message_number = @user.messages.where(:state => false).size if (employer_signed_in? || designer_signed_in?) 
  end
  
  def get_user_prestige
  	get_user
  	if @user == current_employer
  		@user.prestige = employer_prestige
  	elsif @user == current_designer
  		@user.prestige = designer_prestige
  	end
  	@user.save
  end
  
  def get_user
  	@user = current_employer if employer_signed_in?
    @user = current_designer if designer_signed_in?
    @user
  end
  
  def employer_prestige
  	if current_employer.projects.size <= 10
  		@prestige = "Newbie"
  	elsif current_employer.projects.size > 10
  		@prestige = "Has spent Some time"
  	elsif current_employer.projects.size >30
  		@prestige = "Experienced"
  	elsif current_employer.projects.size >50 && (Time.now - current_employer.created_at > (3*28*24*60*60))
  		@prestige = "Ultimate Boss"
  	else
  		@prestige = "God-Like"
  	end
  	@prestige
  end
  
  def designer_prestige
  	if current_designer.submissions.size < 10
  		@prestige = "Rookie"
  	elsif current_designer.submissions.size > 20 && (current_designer.rating > 2.5 && current_designer.rating < 3)
  		@prestige = "Dedicated"
  	elsif current_designer.submissions.size > 20 && (current_designer.rating > 3 && current_designer.rating < 3.5)
  		@prestige = "Enthusiastic"
  	elsif current_designer.submissions.size > 50 && (current_designer.rating > 3.5 && current_designer.rating < 4)
  		@prestige = "Experienced"
  	elsif current_designer.submissions.size > 50 && current_designer.rating >= 4
  		@prestige = "Professional"
  	else
  		@prestige = "Semi-pro"
  	end
  	@prestige
  end
 

  def get_project_state(project)
    if project.status == "open"
      true
    else
      false
    end
  end
  
  def update_project_status
    @projects = Project.all
    @projects.each do |project|
      if project.deadline-Time.now <= 0 && project.status != "Rewarded"
        project.status = "Closed ( Waiting for Reward )"
        project.save
      end
    end
  end
  
end

