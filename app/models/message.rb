class Message < ActiveRecord::Base
  belongs_to :employer
  belongs_to :designer
end
