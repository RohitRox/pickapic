class Submission < ActiveRecord::Base
  belongs_to :designer
  belongs_to :project
  has_attached_file :screenshot, :styles => { :medium => "500x500>", :thumb => "220x180>" }
  
  validates_attachment_presence :screenshot
  validates_attachment_size :screenshot, :less_than => 1.megabytes
  validates_attachment_content_type :screenshot, :content_type => ['image/jpeg', 'image/png','image/jpg']

  
end
