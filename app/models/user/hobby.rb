class User::Hobby < NewDb
  include UsefullScopes

  attr_accessible :description,
                  :position,
                  :profile_id,
                  :title

  belongs_to :profile
end
