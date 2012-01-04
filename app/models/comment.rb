class Comment < ActiveRecord::Base
  belongs_to :employer
  belongs_to :submission
end
