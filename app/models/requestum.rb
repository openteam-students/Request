class Requestum < ActiveRecord::Base
  attr_accessible :date_time, :id_performer, :id_project, :id_source, :status_request, :text, :theme
end
