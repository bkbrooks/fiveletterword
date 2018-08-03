require 'rails_helper'

RSpec.describe 'Guesses API', type: :request do
  # initialize test data 
  let!(:games) { create_list(:game, 10) }
  let(:game_id) { games.first.id }

  # Test suite for POST /make_guess
  describe 'POST /make_guess' do
    # valid payload

    context 'when the request is valid' do
      before do 
        Word.create(word: 'hello')
        post "/games/#{game_id}/make_guess", params: { format: 'json', text: 'hello' }
      end

      it 'creates a guess' do
        expect(Guess.count).to eq(1)
      end

      it 'returns a guess id' do
        expect(json['id']).not_to eq(nil)
        expect(json['word_exists']).to eq(true)
      end

      it 'returns a correct_letter amount' do
        expect(json['correct_letters']).not_to eq(nil)
      end

      it 'returns a correct_placement amount' do
        expect(json['correct_placement']).not_to eq(nil)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the guess has a few letters that match' do
      before do
        Word.create(word: 'tilde')
        word = Word.create(word: 'zelda')
        game = Game.create(word: word)
        post "/games/#{game.id}/make_guess", params: { format: 'json', text: 'tilde' }
      end

      it 'returns the correct_letter count for number of letters that exist' do
        expect(json['correct_letters']).to eq(3)
      end

      it 'return the correct_placement count for number of letters in the correct locations' do
        expect(json['correct_placement']).to eq(2)
      end
    end

    context 'when the guess has duplicate letters that match' do
      before do
        Word.create(word: 'hello')
        word = Word.create(word: 'zelda')
        game = Game.create(word: word)
        post "/games/#{game.id}/make_guess", params: { format: 'json', text: 'hello' }
      end

      it 'returns the correct_letter count for number of letters that exist' do
        expect(json['correct_letters']).to eq(2)
      end

      it 'return the correct_placement count for number of letters in the correct locations' do
        expect(json['correct_placement']).to eq(2)
      end
    end

    context 'when the word doesnt exist in our dictionary' do
      before do
        word = Word.create(word: 'prize')
        game = Game.create(word: word)
        post "/games/#{game.id}/make_guess", params: { format: 'json', text: 'hello' }
      end

      it 'returns false for wordExists and 0 for letter counts' do
        expect(json['correct_letters']).to eq(0)
        expect(json['correct_placement']).to eq(0)
        expect(json['word_exists']).to eq(false)
      end
    end
  end
end
