FactoryBot.define do
  factory :event do
    title {Faker::Lorem.sentence}
    contents {Faker::Lorem.sentence}
    start_time {Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :long)}
    finish_time {Faker::Time.between(from: DateTime.now - 1, to: DateTime.now, format: :long)}

    association :user

  end
end
