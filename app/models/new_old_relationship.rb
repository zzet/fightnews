class NewOldRelationship < ActiveRecord::Base
  include UsefullScopes

  attr_accessible :new_item_id, :new_item_type, :old_item_id

  belongs_to :new_item, polymorphic: true
end
