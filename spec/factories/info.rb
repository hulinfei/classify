# This will guess the User class
FactoryBot.define do
  factory :info do
    # 标题
  title  'title'
  # 联系方式
  phone  '1111'
  # 描述
  description '111'
  # 详情
  details '111'
  # 地址
  address '1111'
  wx_user
  category
  end
end