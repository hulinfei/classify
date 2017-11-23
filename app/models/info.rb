class Info
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Attributes::Dynamic
  include Mongoid::Search

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
  field :view, type: Integer, default: 0
  # 状态 0 待审核 1 已审核
  field :status, type: Integer, default: 0
  # 是否置顶
  field :top, type: Mongoid::Boolean, default: false

  #关联关系
  has_and_belongs_to_many :info_types
  has_many :photos
  belongs_to :wx_user
  belongs_to :category

  #验证规则
  validates :phone, presence: true

  # 全文搜索
  search_in :title, :phone, :description, :address, :status

  # 回调方法
  before_validation :validate_dynamic_attrs

  # 获取用户IP存入redis
  def inc_viewer(ip)
    $redis.sadd("info:#{self.id}:ips", ip)
  end

  # 获取查看文章的IP个数
  def view_count
    $redis.scard("info:#{self.id}:ips")
  end

  private

  #info_type验证规则判断
  def validate_dynamic_attrs
    info_types = self.category.info_class.info_types
    info_types.each do |info_type|
      unless info_type.validation_rule.blank?
        regexp_str =/#{info_type.validation_rule}/
        if (regexp_str  =~ self[info_type.fieldname.to_sym] ).nil?
          self.errors[info_type.fieldname.to_sym] << '请输入符合规则的数据'
          puts self.errors.full_messages
          break
        end
      end
    end
  end
end
