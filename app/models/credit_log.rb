class CreditLog
  include Mongoid::Document
  include Mongoid::Timestamps
  # 积分日志
  field :log, type: String

  belongs_to :wx_user
end
