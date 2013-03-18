class News < NewDb
  include UsefullScopes
  include NewsRepository

  attr_accessible :autor_id,
                  :body,
                  :description,
                  :photo,
                  :source,
                  :title,
                  :hot,
                  :state,
                  :state_event,
                  :category_ids, :tag_ids

  # TODO
  belongs_to :autor, class_name: User
  #validate :autor, presence: true

  # TODO
  #has_one :news_rating, dependent: :destroy
  has_one :new_old_relationship, as: :new_item, dependent: :destroy

  has_many :news_categories, dependent: :destroy, class_name: News::Category
  has_many :categories, through: :news_categories

  has_many :news_tags, dependent: :destroy, class_name: News::Tag
  has_many :tags, through: :news_tags

  mount_uploader :photo, PhotoUploader

  state_machine :state, :initial => :unpublished do
    state :unpublished
    state :drafted
    state :published do
      validates :title, presence: true
      validates :description, presence: true
      validates :body, presence: true
    end

    event :publish do
      transition [:unpublished, :draft] => :published
    end

    event :unpublish do
      transition [:published] => :unpublished
    end

    event :draft do
      transition [:published, :unpublished] => :drafted
    end
  end

end
