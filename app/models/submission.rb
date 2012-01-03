class Submission < ActiveRecord::Base
  belongs_to :designer
  belongs_to :project
  has_attached_file :screenshot, :styles => { :medium => "500x500>", :thumb => "220x180>" }
end
