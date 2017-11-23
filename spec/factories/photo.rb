# This will guess the User class
FactoryBot.define do
  factory :photo do
    name "昆明"
    domain "www.abc.com"
    weixin_appid ""
    weixin_appsecret ""
    subscribe_text ""
    logo { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'support', 'site', 'a.jpg'), 'image/jpeg') }
  end
end