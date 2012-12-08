class User::Profile < NewDb
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
end
