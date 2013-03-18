class User::Person < NewDb
  include UsefullScopes

  attr_accessible :biography_id,
                  :position,
                  :profile_id
end
