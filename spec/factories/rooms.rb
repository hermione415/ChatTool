FactoryBot.define do
  factory :room do
    name { Faker::Team.name }
    info { Faker::Lorem.sentence }
  end
end
