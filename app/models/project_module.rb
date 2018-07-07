class ProjectModule < ActiveRecord::Base
  belongs_to :project
  has_many :module_test_cases
  has_many :milestone_cases
end
