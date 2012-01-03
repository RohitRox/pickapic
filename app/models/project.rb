class Project < ActiveRecord::Base
  belongs_to :employer
  has_many :submissions
end
