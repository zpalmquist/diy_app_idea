FactoryBot.define do
  factory :venue do
    sequence(:name) { |n| "Shitshow_#{n}" }    
    locality
  end
end
