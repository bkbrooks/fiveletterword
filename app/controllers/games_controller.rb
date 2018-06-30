class GamesController < ApplicationController
  before_action :set_game, only: [:show, :update]

  # GET /todos
  def index
    @games = Game.all
    json_response(@games)
  end

  # POST /todos
  def create
    @word = Word.offset(rand(Word.count)).first
    @game = Game.create!(guesses: 0, word: @word)

    json_response(@game, :created)
  end

  # GET /todos/:id
  def show
    json_response(@game)
  end

  # PUT /todos/:id
  def update
    @game.update(game_params)
    head :no_content
  end

  private

  def game_params
    # whitelist params
    params.permit(:guesses)
  end

  def set_game
    @game = Game.find(params[:id])
  end
end
