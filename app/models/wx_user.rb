class WxUser
  include Mongoid::Document
  include Mongoid::Timestamps
  # 用户是否订阅公众号 0 代表用户没有关注公众号
  field :subscribe, type: Integer
  # openID
  field :openid, type: String
  # 昵称
  field :nickname, type: String
  # 用户性别 1 男性 2 女性 3 未知
  field :sex, type: Integer
  # 用户的语言
  field :language, type: String
  # 用户所在城市
  field :city, type: String
  # 用户所在省份
  field :province, type: String
  # 用户所在国家
  field :country, type: String
  # 用户头像 最后一个数值代表正方形头像大小（有0、46、64、96、132数值可选，0代表640*640正方形头像）
  field :headimgurl, type: String
  # 用户关注时间，为时间戳
  field :subscribe_time, type: Integer
  # 只有在用户将公众号绑定到微信开放平台帐号后，才会出现该字段。
  field :unionid, type: String
  # 公众号运营者对粉丝的备注
  field :remark, type: String
  # 用户所在的分组ID
  field :groupid, type: Integer
  # 用户被打上的标签ID列表
  field :tagid_list, type: String

  has_many :infos
  belongs_to :site, counter_cache: true # 统计所属site的 wx_users
end