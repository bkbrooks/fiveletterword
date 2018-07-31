require 'rails_helper'

RSpec.describe 'Games API', type: :request do
  # initialize test data 
  let!(:games) { create_list(:game, 10) }
  let(:game_id) { games.first.id }
  let!(:words) { create_list(:word, 10) }

  # Test suite for GET /games
  describe 'GET /games' do
    # make HTTP get request before each example
    before { get '/games' }

    it 'returns games' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /games/:id
  describe 'GET /games/:id' do
    before { get "/games/#{game_id}", params: { format: 'json' } }

    context 'when the record exists' do
      it 'returns the game' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(game_id)
      end

      it 'does not return a word or word_id' do
        expect(json['word_id']).to eq(nil)
        expect(json['word']).to eq(nil)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:game_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Game/)
      end
    end
  end

  # Test suite for POST /games for creating a game
  describe 'POST /games' do
    # valid payload

    context 'when the request is valid' do
      before { post '/games', params: { format: 'json' } }

      it 'creates a game' do
        expect(json['id']).not_to eq(nil)
      end

      it 'does not return a word or word_id' do
        expect(json['word_id']).to eq(nil)
        expect(json['word']).to eq(nil)
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end
  end
end
