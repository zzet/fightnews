class LegacyDb < ActiveRecord::Base
  self.abstract_class = true
  establish_connection "legacy_development"
end

class NewDb < ActiveRecord::Base
  self.abstract_class = true
  establish_connection "development"
end
