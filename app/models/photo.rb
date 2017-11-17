class Photo
  include Mongoid::Document
  include Mongoid::Timestamps

  mount_uploader :img, AvatarUploader

  belongs_to :info
end
