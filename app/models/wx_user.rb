class WxUser
  include Mongoid::Document
  include Mongoid::Timestamps
  # 用户昵称
  field :nickname, type: String
  # 用户openid
  field :openid, type: String
end
