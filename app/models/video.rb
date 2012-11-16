class Video < Post
  attr_accessible :autor_id,
                  :body,
                  :description,
                  :photo,
                  :source,
                  :title,
                  :hot,
                  :state

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
