class Info
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic
  validates :phone, presence: true
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

  before_validation :validate_dynamic_attrs

  has_and_belongs_to_many :info_types
  has_many :photos
  belongs_to :wx_user
  belongs_to :category

  def validate_dynamic_attrs
    puts '不匹配====='
    info_types = self.category.info_class.info_types
    info_types.each do |info_type|

      unless info_type.validation_rule.blank?
        puts '=============================='
        puts self[info_type.fieldname.to_sym]
        regexp_str =/^#{info_type.validation_rule}$/
        if (regexp_str  =~ self[info_type.fieldname.to_sym] ).nil?
          self.errors[info_type.fieldname.to_sym] << 'errors!!!!!!!'
          puts '=============================='
          puts self.errors.full_messages
          break
        end
      end
    end
  end
end
