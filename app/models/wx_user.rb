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
  # 用户取消关注时间，为时间戳
  field :unsubscribe_time, type: Integer
  # 只有在用户将公众号绑定到微信开放平台帐号后，才会出现该字段。
  field :unionid, type: String
  # 公众号运营者对粉丝的备注
  field :remark, type: String
  # 用户所在的分组ID
  field :groupid, type: Integer
  # 用户被打上的标签ID列表
  field :tagid_list, type: String
  # 用户积分
  field :credit, type: Integer, default: 0

  # 用户签到，当用户积分日志为空，或最后一条日期小于当前日期，才可签到。
  def sign
    wx_user_logs = CreditLog.where(log: "用户签到增加1点积分", wx_user_id: id)
    if wx_user_logs.count == 0 || wx_user_logs.last.created_at.strftime("%F") < Time.new.strftime("%F")
      self.inc(credit: 1)
      CreditLog.create(log: "用户签到增加1点积分",wx_user_id: id)
      "用户签到增加1点积分"
    else
      "对不起，您今天已经签到了！"
    end
  end

  has_many :infos
  has_many :credit_logs
  belongs_to :site, counter_cache: true # 统计所属site的 wx_users
end