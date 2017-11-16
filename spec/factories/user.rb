# This will guess the User class
FactoryBot.define do
  factory :user do
    email "John@lindo.io"
    password "123123"
    credit  0
  end
end