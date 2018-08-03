class GamesController < ApplicationController
  before_action :set_game, only: [:show]

  # GET /games
  def index
    @games = Game.all
    json_response(@games)
  end

  # POST /games
  def create
    word = Word.where(unique_letters: true).sample(1).first
    @game = Game.create!(word: word)

    render :show, status: :created
  end

  # GET /games/:id
  def show
  end

  private

  def set_game
    @game = Game.find(params[:id])
  end
end
