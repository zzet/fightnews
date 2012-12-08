class User::Hobby < NewDb
  attr_accessible :description,
                  :position,
                  :profile_id,
                  :title

  belongs_to :profile
end
