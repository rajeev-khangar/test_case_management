class Project < ActiveRecord::Base
  has_many :milestones, dependent: :destroy
  has_many :project_modules, dependent: :destroy

  validates :title, presence: true, uniqueness: true
end
