class ProjectsController < ApplicationController
  # GET /projects
  # GET /projects.json
include ApplicationHelper
before_filter :authenticate_access
before_filter :get_messages, :get_user_prestige
  
  def index
    @projects = Project.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.find(params[:id])
    @submissions = @project.submissions.order('rating desc')
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    @project = Project.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/1/edit
  def edit
     @project = Project.find(params[:id])
    if @project.employer == current_employer && @project.status == "open"
     true 
    else
      redirect_to @project,:alert => "You Are Not The Auhtor of This Project"
    end
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = current_employer.projects.new(params[:project])
    @project.project_type=params[:project_type]
    @project.file_type=params[:file_type].join(", ")
    @project.logo_type=params[:logo_type].join(",")
    if @project.deadline > Time.now
      respond_to do |format|
        if @project.save
          
          format.html { redirect_to @project, notice: 'Project was successfully created.' }
          format.json { render json: @project, status: :created, location: @project }
        else
          format.html { redirect_to employer_root_path, notice: 'Invalid entries to fields.' }
          format.json { render json: @project.errors, status: :unprocessable_entity }
        end
      end
    else
       redirect_to employer_root_path, alert: 'Invalid Deadline to past date.' 
    end
  end

  # PUT /projects/1
  # PUT /projects/1.json
  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

 
end
