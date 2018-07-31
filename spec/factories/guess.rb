FactoryBot.define do
  factory :guess do
    text { Faker::Lorem.word }
    game { Game.create }
  end
end
