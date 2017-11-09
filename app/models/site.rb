class Site
  include Mongoid::Document
  include Mongoid::Timestamps

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

  has_many :bannars
  has_many :wx_users
  belongs_to :user
end
