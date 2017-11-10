class BottomMenu
  include Mongoid::Document
  include Mongoid::Timestamps

  paginates_per 5
  
  #底部菜单名称
  field :name, type: String
  #底部菜单图标
  mount_uploader :icon, AvatarUploader

  belongs_to :site
end
