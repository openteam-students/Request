class Issue < ActiveRecord::Base
  belongs_to :executor
  belongs_to :project
  attr_accessible :state
end
