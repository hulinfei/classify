class InfoType
  include Mongoid::Document
  include Mongoid::Timestamps
  # 表头名
  field :name, type: String
  # 字段名
  field :fieldname, type: String
  # 字段类型
  field :fieldtype, type: String
  # 输出类型 例如input...
  field :optype, type: String
  # 验证规则
  field :validation_rule, type: String
  # 是否显示为表头
  field :show, type: Mongoid::Boolean

  belongs_to :info_class
  belongs_to :info
end
