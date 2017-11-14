class InfoClass
  include Mongoid::Document
  include Mongoid::Timestamps
  # 类型名
  field :name, type: String

  has_many :info_types
  has_many :categories
end
