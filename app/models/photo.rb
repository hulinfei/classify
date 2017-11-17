class Photo
  include Mongoid::Document
  include Mongoid::Timestamps
  # 图片地址
  mount_uploader :img, AvatarUploader

  field :random_number, type: String

  belongs_to :info
end
