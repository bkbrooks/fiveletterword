class GuessesController < ApplicationController
  before_action :set_game

  # POST /make_guesses
  def make_guess
    @guess = Guess.create(game: @game, text: params[:text])

    render :show, status: :created
  end

  private

  def set_game
    @game = Game.find(params[:game_id])
  end
end
