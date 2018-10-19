FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "username_#{n}" }
  end
end
