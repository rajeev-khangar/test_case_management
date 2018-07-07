class ProjectModulesController < ApplicationController
  before_action :setup_project_module
  before_action :find_project_module, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
  	@project_module = @project.project_modules.new
  end

  def show
    @module_test_cases = @project_module.module_test_cases
  end

  def create
  	@project_module = @project.project_modules.new(project_module_params)
  	respond_to do |format|
      if @project_module.save
        format.html {redirect_to project_modules_path, notice: "project_module created successfully."}
        format.js
      else
      	format.html {render :new, alert: @project_module.errors.full_messages.join(" ,")}
        format.js
      end
  	end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @project_module.update(project_module_params)
        format.html {redirect_to project_modules_path, notice: "project_module updated successfully."}
        format.js
      else
        format.html {render :new, alert: @project_module.errors.full_messages.join(" ,")}
        format.js
      end
    end
  end

  def destroy
    respond_to do |format|
      if @project_module.destroy
        format.html {redirect_to project_path(@project), notice: "project_module destroyed successfully."}
        format.js
      else
        format.html {render :new, alert: @project_module.errors.full_messages.join(" ,")}
        format.js
      end
    end  
  end

  private
    def project_module_params
      params.require(:project_module).permit(:module_name)	
    end

    def find_project_module
      @project_module = @project.project_modules.find(params[:id])
    end

    def setup_project_module
      @project = Project.find(params[:project_id])
      @project_modules = @project.project_modules  
    end
end