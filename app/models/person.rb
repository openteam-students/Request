class Person < ActiveRecord::Base
  attr_accessible :email, :name, :patronymic, :person_type, :surname
end
