# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'adding words to db'

file = File.join(Rails.root, 'db/words_alpha.txt')
File.open(file, "r").each_line do |line|
  word = line.strip
  if (word.length === 5)
    puts line
    unique_letters = true
    chars = word.chars
    chars.each_with_index do |c, i|
      unique_letters = false if chars[i+1..4].include?(c)
    end
    Word.create(word: word, length: word.length, unique_letters: unique_letters)
  end
end
