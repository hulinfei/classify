# This will guess the User class
FactoryBot.define do
  factory :info_type do
    factory :info_type1 do
      name  '房产'
    # 字段名
     fieldname 'price'
    # 字段类型
     fieldtype 'string'
    # 输出类型 例如input...
     optype 'input'
    # 验证规则
     validation_rule /[0-9]/
    # 是否显示为表头
     show true
     info_class
    end
    factory :info_type2 do
      name  '房产'
    # 字段名
     fieldname 'total'
    # 字段类型
     fieldtype 'string'
    # 输出类型 例如input...
     optype 'input'
    # 验证规则
     validation_rule /[0-9]{2}/
    # 是否显示为表头
     show true
     info_class
    end
  end
end