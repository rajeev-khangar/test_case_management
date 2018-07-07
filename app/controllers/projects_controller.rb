class ProjectsController < ApplicationController
  before_action :setup_project
  before_action :find_project, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
  	@project = Project.new
  end

  def show
  	@milestones = @project.milestones
  	@project_modules = @project.project_modules
  end

  def create
  	@project = Project.new(project_params)
  	respond_to do |format|
      if @project.save
        flash.now[:notice] = "Project created successfully."
        format.html {redirect_to projects_path}
        format.js
      else
        flash.now[:alert] = @project.errors.full_messages.join(" ,")
      	format.html {render :new}
        format.js
      end
  	end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html {redirect_to projects_path, notice: "Project updated successfully."}
        format.js
      else
        format.html {render :new, alert: @project.errors.full_messages.join(" ,")}
        format.js
      end
    end
  end

  def destroy
    respond_to do |format|
      if @project.destroy
        format.html {redirect_to projects_path, notice: "Project destroyed successfully."}
        format.js
      else
        format.html {render :new, alert: @project.errors.full_messages.join(" ,")}
        format.js
      end
    end  
  end

  private
    def project_params
      params.require(:project).permit(:title)	
    end

    def find_project
      @project = Project.find(params[:id])
    end

    def setup_project
      @projects = Project.all  
    end
end
