FactoryBot.define do
  factory :user do
    name { 'テストユーザーA' }
    email { 'aaa@aaa.com' }
    password { 'password' }
    password_confirmation { 'password' }
  end
end
