class Info
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic
  # 标题
  field :title, type: String
  # 联系方式
  field :phone, type: String
  # 描述
  field :description, type: String
  # 详情
  field :details, type: String
  # 地址
  field :address, type: String
  # 浏览量
  field :view, type: Integer
  # 状态 0 待审核 1 已审核
  field :status, type: Integer, default: 0
  # 是否置顶
  field :top, type: Mongoid::Boolean, default: false

  has_many :info_types
  has_many :photos
  belongs_to :wx_user
  belongs_to :category
end
