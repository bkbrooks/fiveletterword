class Game < ApplicationRecord
  # model association
  belongs_to :word
  has_many :guesses
end
