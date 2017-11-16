class Category
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Tree
  # 分类名称
  field :name, type: String
  # 分类图标
  mount_uploader :icon, AvatarUploader

  belongs_to :info_class
  has_many :infos
  belongs_to :site
end
