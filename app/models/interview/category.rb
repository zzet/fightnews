class Interview::Category < NewDb
  attr_accessible :category_id, :interview_id

  belongs_to :interview
  belongs_to :category

  validates :interview, presence: true
  validates :category, presence: true
end
