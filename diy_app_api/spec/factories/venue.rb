FactoryBot.define do
  factory :venue do
    name { |n| "Shitshow_#{n}" }    
    locality
  end
end
