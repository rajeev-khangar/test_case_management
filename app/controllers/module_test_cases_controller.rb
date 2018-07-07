class ModuleTestCasesController < ApplicationController
  before_action :setup_module_test_case
  before_action :find_module_test_case, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
  	@module_test_case = @project_module.module_test_cases.new
  end

  def show
  end

  def create
  	@module_test_case = @project_module.module_test_cases.new(milestone_params)
  	respond_to do |format|
      if @module_test_case.save
        flash[:notice] = "module_test_case created successfully."
        format.html {redirect_to project_project_module_path(@project_module.project, @project_module)}
        format.js
      else
        flash[:alert] = @module_test_case.errors.full_messages.join(" ,")
      	format.html {render :new}
        format.js
      end
  	end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @module_test_case.update(milestone_params)
        format.html {redirect_to project_project_module_path(@project_module.project, @project_module), notice: "module_test_case updated successfully."}
        format.js
      else
        format.html {render :new, alert: @module_test_case.errors.full_messages.join(" ,")}
        format.js
      end
    end
  end

  def destroy
    respond_to do |format|
      if @module_test_case.destroy
        format.html {redirect_to project_project_module_path(@project_module.project, @project_module), notice: "module_test_case destroyed successfully."}
        format.js
      else
        format.html {render :new, alert: @module_test_case.errors.full_messages.join(" ,")}
        format.js
      end
    end  
  end

  private
    def milestone_params
      params.require(:module_test_case).permit(:title, :description)	
    end

    def find_module_test_case
      @module_test_case = @project_module.module_test_cases.find(params[:id])
    end

    def setup_module_test_case
      @project_module = ProjectModule.find(params[:project_module_id])
      @module_test_cases = @project_module.module_test_cases  
    end
end