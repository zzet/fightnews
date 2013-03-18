class User::Photo < NewDb
  include UsefullScopes

  attr_accessible :description, :image, :profile_id, :title
end
