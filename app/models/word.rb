class Word < ApplicationRecord
  # model association
  has_many :games, dependent: :destroy

  # validations
  validates_presence_of :word
end
