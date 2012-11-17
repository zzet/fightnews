class User::Person < ActiveRecord::Base
  attr_accessible :biography_id, :position, :profile_id
end
