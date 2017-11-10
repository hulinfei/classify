class Article
  include Mongoid::Document
  include Mongoid::Timestamps
  # 标题
  field :title, type: String
  # 描述
  field :description, type: String
  # 发布人电话
  field :phone, type: String
  # 阅读次数
  field :view, type: Integer
  # 详情
  field :details, type: String
  # 状态 0 待审核 1 已审核
  field :status, type: Integer, default: 0

  belongs_to :wx_user
  belongs_to :category
end
