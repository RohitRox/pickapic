class Comment < ActiveRecord::Base
  belongs_to :employer
  belongs_to :submission
  belongs_to :designer
  
  
end
