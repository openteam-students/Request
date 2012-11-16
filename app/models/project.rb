class Project < ActiveRecord::Base
  attr_accessible :desc, :email, :title
  has_many :issues
end
