class WxUser
  include Mongoid::Document
  include Mongoid::Timestamps
  # 用户昵称
  field :nickname, type: String
  # 用户openid
  field :openid, type: String
  # 用户头像
  mount_uploader :avatar, AvatarUploader

  belongs_to :site
end
