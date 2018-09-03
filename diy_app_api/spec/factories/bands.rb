FactoryBot.define do
  factory :band do
    sequence(:name) { |n| "The (T)est Band: #{n}"}
    locality
  end
end
