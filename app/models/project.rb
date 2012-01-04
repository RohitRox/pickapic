class Project < ActiveRecord::Base
  belongs_to :employer
  has_many :submissions
  validates :title, :description, :budget, :deadline, :presence => true
  
end
