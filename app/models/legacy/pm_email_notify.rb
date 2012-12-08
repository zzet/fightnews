class Legacy::PmEmailNotify < ActiveRecord::Base
  set_table_name  :pm_email_notify
  set_primary_key :no_primary_key

  # Relationships
  

  # Constraints
  validates_numericality_of :user_id, :email_notify_is_enabled
  validates_presence_of :user_id, :email_notify_is_enabled
  validates_uniqueness_of :user_id
end

