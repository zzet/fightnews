class User::Profile < NewDb
  include UsefullScopes

  attr_accessible :birthdate,
                  :city_id,
                  :country_id,
                  :description,
                  :firstname,
                  :lastname

  belongs_to :user

  has_many :persons, dependent: :destroy
  has_many :hobbies, dependent: :destroy
  has_many :photos, dependent: :destroy

  validates :birthdate, presence: true

  has_one :new_old_relationship, as: :new_item, dependent: :destroy
end
