class Game < ApplicationRecord
  # model association
  belongs_to :word

  # validation
  validates_presence_of :guesses
end
