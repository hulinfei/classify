class Bannar
  include Mongoid::Document
  include Mongoid::Timestamps

  #标题
  field :title, type: String
  #URL
  field :url, type: String
  #是否激活
  field :active, type: Mongoid::Boolean

  mount_uploader :avatar, AvatarUploader
end
