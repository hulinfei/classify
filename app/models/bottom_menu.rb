class BottomMenu
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Orderable

  paginates_per 5

  #底部菜单名称
  field :name, type: String
  #底部菜单名称
  field :url, type: String
  #底部菜单图标
  mount_uploader :icon, AvatarUploader
  #底部菜单激活图标
  mount_uploader :active_icon, AvatarUploader

  belongs_to :site
  orderable
end
