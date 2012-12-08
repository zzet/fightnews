class Legacy::InviteNotification < ActiveRecord::Base
  set_primary_key :no_primary_key

  # Relationships
  

  # Constraints
  #validates_uniqueness_of_multiple_column_constraint ["uid", "invitee"]
  validates_numericality_of :uid, :invitee
  validates_presence_of :uid, :invitee
end

