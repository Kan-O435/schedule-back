FactoryBot.define do
  factory :plan do
    title { "テスト予定" }
    start_time { Time.current }
    end_time { Time.current + 1.hour }
    association :user
  end
end
