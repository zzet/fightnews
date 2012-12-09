class Legacy::User < LegacyDb
  set_primary_key :uid

  # Relationships
  has_many :users_role, foreign_key: :uid
  has_many :role, through: :users_role
  has_one :usernode, foreign_key: :uid
  has_one :profile, foreign_key: :uid
  has_many :ban_user, foreign_key: :uid

  # Constraints
  validates_numericality_of :created, :access, :login, :status, :picture
  validates_presence_of :name, :pass, :theme, :signature, :created, :access, :login, :status, :language, :timezone_name, :picture
  validates_uniqueness_of :name

  def url_alias
    ua = Legacy::UrlAlias.where("source = 'user/#{uid}'")
    if ua.present?
      ua.first.alias
    end
  end

  def banned?
    Legacy::BanUser.find_by_uid(uid).present?
  end

  def notify_about_comments?
    cn = Legacy::CommentNotifyUserSetting.find_by_uid(uid).comment_notify
    nn = Legacy::CommentNotifyUserSetting.find_by_uid(uid).node_notify
    [nn, cn]
  end

  def notify_about_pm?
    Legacy::PmEmailNotify.find_by_user_id(uid).email_notify_is_enabled == 1
  end
end

