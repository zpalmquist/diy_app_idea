FactoryBot.define do
  factory :user do
    sequence(:username) { |n| "username_#{n}" }
    sequence(:email) { |n| "email_#{n}@email.com" }
    sequence(:password) { |n| "password#{n}" }
    uid { nil }
  end
end
