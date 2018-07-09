class Milestone < ActiveRecord::Base
  has_many :milestone_cases, dependent: :destroy
  belongs_to :project
  validates_presence_of :name, :start_date, :end_date
  accepts_nested_attributes_for :milestone_cases
  
  module STATUS
   NOT_TESTED = 0
   SUCCESS = 1
   FAILED = 2
  end

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

  def successive_cases
    return 0 if milestone_cases.blank?
    milestone_cases.where(status: STATUS::SUCCESS).count.to_f/milestone_cases.count.to_f
  end

  def failes_cases
    return 0 if milestone_cases.blank?
    milestone_cases.where(status: STATUS::FAILED).count.to_f/milestone_cases.count.to_f
  end

  def not_tested_cases
    return 0 if milestone_cases.blank?
    milestone_cases.where(status: STATUS::NOT_TESTED).count.to_f/milestone_cases.count.to_f
  end
end