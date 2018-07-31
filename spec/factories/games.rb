FactoryBot.define do
  factory :game do
    association :word, factory: :word
  end
end
