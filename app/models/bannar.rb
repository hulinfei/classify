class Bannar
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Orderable
  validates :title, presence: true
  paginates_per 5

  #标题
  field :title, type: String
  #URL
  field :url, type: String
  #是否激活
  field :active, type: Mongoid::Boolean
  #结束时间
  field :end_time, type: Date

  scope :actived, -> { where(active: true) }

  scope :not_expired, -> { where(:end_time.gt => Date.new) }

  mount_uploader :avatar, AvatarUploader

  belongs_to :site, counter_cache: true # 统计所属site的 bannars
  orderable
end
