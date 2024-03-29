class User < NewDb
  include UsefullScopes

  ## Include default devise modules. Others available are:
  ## :token_authenticatable, :confirmable,
  ## :lockable, :timeoutable and :omniauthable
  #devise :database_authenticatable, :registerable,
    #:recoverable, :rememberable, :trackable, :validatable, :omniauthable

  ## Setup accessible (or protected) attributes for your model
  attr_accessible :email,
                  :password,
                  :password_confirmation,
                  :remember_me,
                  :nickname,
                  :provider,
                  :url,
                  :username,
                  :remote_avatar_url,
                  :state,
                  :state_event

  has_one :profile, dependent: :destroy
  has_one :new_old_relationship, as: :new_item, dependent: :destroy

  #validates :email, presence: true, uniqueness: true
  validates :nickname, presence: true, uniqueness: true

  mount_uploader :avatar, AvatarUploader

  state_machine :state, :initial => :new do
    state :new
    state :active
    state :banned
    state :deleted

    state :active do

    end

    event :activate do
      transition [:new, :banned, :deleted] => :active
    end

    event :ban do
      transition [:new, :active] => :banned
    end

    event :remove do
      transition [:new, :active, :banned] => :deleted
    end
  end

  def self.find_by_old_id(id)
    rel = NewOldRelationship.find_by_old_item_id_and_new_item_type(id, "User")
    if rel
      rel.new_item_id
    else
      1
    end
  end

  #def self.find_for_facebook_oauth access_token
    #if user = User.where(:url => access_token.info.urls.Facebook).first
      #user
    #else 
      #User.create!(:provider => access_token.provider, :url => access_token.info.urls.Facebook, :username => access_token.extra.raw_info.name, :nickname => access_token.extra.raw_info.username, :email => access_token.extra.raw_info.email, :password => Devise.friendly_token[0,20]) 
    #end
  #end

  #def self.find_for_vkontakte_oauth access_token
    #if user = User.where(:url => access_token.info.urls.Vkontakte).first
      #user
    #else 
      #User.create!(:provider => access_token.provider, :url => access_token.info.urls.Vkontakte, :username => access_token.info.name, :nickname => access_token.extra.raw_info.domain, :email => access_token.extra.raw_info.domain+'<hh user=vk>.com', :password => Devise.friendly_token[0,20]) 
    #end
  #end
end
