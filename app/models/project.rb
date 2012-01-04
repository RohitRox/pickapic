class Project < ActiveRecord::Base
  belongs_to :employer
  has_many :submissions
  validates :title, :description, :budget, :deadline, :project_type, :presence => true
  
end
