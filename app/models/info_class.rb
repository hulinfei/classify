class InfoClass
  include Mongoid::Document
  include Mongoid::Timestamps
  # 类型名
  field :name, type: String

  has_many :info_types
  belongs_to :category
end
