FactoryBot.define do
  factory :word do
    word { Faker::Lorem.word }
  end
end
