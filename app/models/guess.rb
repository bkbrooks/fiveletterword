class Guess < ApplicationRecord
  belongs_to :game

  def correct_letters
    word = game.word.word
    correct = 0
    word.each_char do |char|
      correct = correct + 1 if text.include? char
    end

    correct
  end

  def correct_placement
    word_chars = game.word.word.chars
    text_chars = text.chars
    correct = 0
    (0..(word_chars.length - 1)).each do |i|
      correct = correct + 1 if word_chars[i] === text_chars[i]
    end

    correct
  end
end
