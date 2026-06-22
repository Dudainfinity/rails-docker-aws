FactoryBot.define do
  factory :note do
    sequence(:title) { |n| "Note #{n}" }
    body { Faker::Lorem.paragraph }
    published { false }

    trait :published do
      published { true }
    end
  end
end
