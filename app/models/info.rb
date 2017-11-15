class Info
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic
  # 标题
  field :title, type: String
  # 联系方式
  field :phone, type: String
  # 描述详情
  field :description, type: String
  # 浏览量
  field :view, type: Integer
  # 状态 0 待审核 1 已审核
  field :status, type: Integer, default: 0

  has_many :info_types
  belongs_to :wx_user
  belongs_to :category
end
