class Legacy::CommentNotifyUserSetting < LegacyDb
  set_primary_key :uid

  # Relationships
  

  # Constraints
  validates_numericality_of :node_notify, :comment_notify
  validates_presence_of :node_notify, :comment_notify
end

