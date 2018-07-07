class Milestone < ActiveRecord::Base
  has_many :milestone_cases, dependent: :destroy
  belongs_to :project
  validates_presence_of :name, :start_date, :end_date
  accepts_nested_attributes_for :milestone_cases
  
  def status_by_date
    if end_date < Time.now
      "Completed"
    elsif (start_date < Time.now) && (Time.now < end_date)
      "In-progress"
    else
    	"Not Started"
    end	
  end

  def milestone_case_already_exist?(module_test_case_id, project_module_id)
    milestone_cases.find_by(module_test_case_id: module_test_case_id, project_module_id: project_module_id).present?
  end
end