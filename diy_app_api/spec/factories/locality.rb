FactoryBot.define do
  factory :locality do
    sequence(:name) { |n| "City_#{n}"}
    administrative_area
  end
end
