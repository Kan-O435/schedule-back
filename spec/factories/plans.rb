# spec/factories/plans.rb
FactoryBot.define do
    factory :plan do
      title { "Sample Plan" }
      content { "Some details" }
      start_time { Time.now }
      end_time { Time.now + 1.hour }
      association :user
    end
  end
  