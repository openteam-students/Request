class Email < ActiveRecord::Base
  belongs_to :sender
  belongs_to :issue
  belongs_to :project
  attr_accessible :body, :subject, :uid
end
