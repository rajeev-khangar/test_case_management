class MilestoneCasesController < ApplicationController
  before_action :setup_modules

  def index
    @module_test_cases.each { |module_test_case| @milestone.milestone_cases.new(module_test_case_id: module_test_case.id, project_module_id: @project_module.id) unless @milestone.milestone_case_already_exist?(module_test_case.id, @project_module.id)}
  end

  def create
    if @milestone.update(milestone_params)
      flash.now[:notice] = "Milestone case updated."
    else
      flash.now[:alert] = @milestone.errors.full_messages.join(' ,')
    end  
  end

  private
    def setup_modules
      @milestone = Milestone.find(params[:milestone_id])
      @project_module = ProjectModule.find(params[:project_module_id])
      @module_test_cases = @project_module.module_test_cases  
    end

    def milestone_params
      params.require(:milestone).permit(milestone_cases_attributes: [:id, :project_module_id, :module_test_case_id, :status])
    end
end