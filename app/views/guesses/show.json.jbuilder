json.id @guess.id
json.text @guess.text
json.word_exists @word != nil
json.correct_letters @word ? @guess.correct_letters : 0
json.correct_placement @word ? @guess.correct_placement : 0
