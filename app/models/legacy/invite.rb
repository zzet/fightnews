class Legacy::Invite < ActiveRecord::Base
  set_table_name  :invite
  set_primary_key :no_primary_key

  # Relationships
  belongs_to :user, foreign_key: :uid
  has_many :invited, foreign_key: :uid, primary_key: :invitee, class_name: Legacy::User

  # Constraints
  validates_numericality_of :uid, :invitee, :created, :expiry, :joined, :canceled, :resent
  validates_presence_of :reg_code, :email, :uid, :invitee, :created, :expiry, :joined, :canceled, :resent, :data
  validates_uniqueness_of :reg_code
end

