class Site
  include Mongoid::Document
  include Mongoid::Timestamps
  include WeixinRailsMiddleware::AutoGenerateWeixinTokenSecretKey

  paginates_per 3
  #站点名称
  field :name, type: String
  #域名
  field :domain, type: String
  #微信appid
  field :weixin_appid, type: String
  #微信appsecret
  field :weixin_appsecret, type: String
  #微信secret_key
  field :weixin_secret_key, type: String
  #微信token
  field :weixin_token, type: String
  # 站点二维码
  mount_uploader :qr, AvatarUploader
  # 站点LOGO
  mount_uploader :logo, AvatarUploader
  # 统计site的wx_users个数
  field :wx_users_count, type: Integer, default: 0
  # 统计site的bannars个数
  field :bannars_count, type: Integer, default: 0

  has_many :bannars
  has_many :wx_users
  has_many :bottom_menus
  has_many :diymenus
  has_many :users

  def client
    @client ||= WeixinAuthorize::Client.new(weixin_appid, weixin_appsecret, redis_key: id.to_s)
  end
end

