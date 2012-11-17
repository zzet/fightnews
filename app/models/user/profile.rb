class User::Profile < ActiveRecord::Base
  attr_accessible :birthdate, :city_id, :country_id, :description, :firstname, :lastname
end
