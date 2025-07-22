FactoryBot.define do
  factory :user do
    uid { SecureRandom.uuid }
    name { "テストユーザー" }
    email { Faker::Internet.email }
  end
end
