FactoryBot.define do
  factory :game do
    guesses 0
    word Word.create
  end
end
