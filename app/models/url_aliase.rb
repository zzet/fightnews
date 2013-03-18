class UrlAliase < ActiveRecord::Base
  include UsefullScopes

  attr_accessible :aliase, :source_id, :source_type
end
