# spec/factories/share_plans.rb
FactoryBot.define do
  factory :share_plan do
    association :user
    association :plan
  end
end
