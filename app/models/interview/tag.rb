class Interview::Tag < ActiveRecord::Base
  attr_accessible :interview_id, :tag_id

  belongs_to :interview
  belongs_to :tag

  validates :interview, presence: true
  validates :tag, presence: true
end
