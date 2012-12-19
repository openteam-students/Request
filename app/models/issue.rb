class Issue < ActiveRecord::Base
  has_one :email
  belongs_to :executor
  belongs_to :project
  attr_accessible :state
end
