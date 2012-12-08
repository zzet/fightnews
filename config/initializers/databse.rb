class LegacyDb < ActiveRecord::Base
  self.abstract_class = true
  establish_connection "legacy_#{RAILS_ENV}"
end

class NewDb < ActionsOldContribiveRecord::Base
  self.abstract_class = true
  establish_connection "#{RAILS_ENV}"
end
