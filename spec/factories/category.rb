# This will guess the User class
FactoryBot.define do
  factory :category do
    name "分类1"

    icon { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'support', 'site', 'a.jpg'), 'image/jpeg') }
    site
    info_class
  end
  factory :category2 do
    name "分类3"

    icon { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'support', 'site', 'a.jpg'), 'image/jpeg') }
    site
    info_class
  end
end