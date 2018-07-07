class MilestonesController < ApplicationController
  before_action :setup_milestone
  before_action :find_milestone, only: [:show, :edit, :update, :destroy]

  def index
  end

  def new
  	@milestone = @project.milestones.new
  end

  def show
    @project_modules = @project.project_modules
  end

  def create
  	@milestone = @project.milestones.new(milestone_params)
  	respond_to do |format|
      if @milestone.save
        flash.now[:notice] = "Milestone created successfully."
        format.html {redirect_to milestones_path}
        format.js
      else
        flash.now[:alert] = @milestone.errors.full_messages.join(" ,")
      	format.html {render :new, alert: @milestone.errors.full_messages.join(" ,")}
        format.js
      end
  	end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @milestone.update(milestone_params)
        flash.now[:notice] = "Milestone updated successfully."
        format.html {redirect_to milestones_path}
        format.js
      else
        flash.now[:alert] = @milestone.errors.full_messages.join(" ,")
        format.html {render :new}
        format.js
      end
    end
  end

  def destroy
    respond_to do |format|
      if @milestone.destroy
        format.html {redirect_to project_path(@project), notice: "milestone destroyed successfully."}
        format.js
      else
        format.html {render :new, alert: @milestone.errors.full_messages.join(" ,")}
        format.js
      end
    end  
  end

  private
    def milestone_params
      params.require(:milestone).permit(:name, :start_date, :end_date)	
    end

    def find_milestone
      @milestone = @project.milestones.find(params[:id])
    end

    def setup_milestone
      @project = Project.find(params[:project_id])
      @milestones = @project.milestones  
    end
end