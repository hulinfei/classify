class Category
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Tree
  # 分类名称
  field :name, type: String
  # 分类图标
  mount_uploader :icon, AvatarUploader

  has_many :articles
end
