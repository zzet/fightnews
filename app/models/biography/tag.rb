class Biography::Tag < NewDb
  include UsefullScopes

  attr_accessible :biography_id, :tag_id

  belongs_to :biography
  belongs_to :tag

  validates :biography, presence: true
  validates :tag, presence: true
end
