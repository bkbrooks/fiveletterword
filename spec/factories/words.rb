FactoryBot.define do
  factory :word do
    word { Faker::Lorem.word }
    length 5
    unique_letters true
  end
end
