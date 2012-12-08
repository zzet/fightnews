class Legacy::Comment < ActiveRecord::Base
  set_table_name  :comment
  set_primary_key :cid

  # Relationships
  has_many :comment, foreign_key: :pid
  has_many :field_data_comment_body, :foreign_key => :entity_id

  # Constraints
  validates_numericality_of :pid, :nid, :uid, :changed, :score, :status, :created
  validates_presence_of :pid, :nid, :uid, :subject, :hostname, :changed, :score, :status, :thread, :language, :created

  def body
    field_data_comment_body.first.comment_body_value
  end


  def autor
    User.find_by_uid(uid)
  end

end

