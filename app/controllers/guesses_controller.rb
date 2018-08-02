class GuessesController < ApplicationController
  before_action :set_game

  # POST /make_guesses
  def make_guess
    @guess = Guess.create(game: @game, text: guess_params[:text])

    render :show, status: :created
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def guess_params
    params.permit(
      :text
    )
  end

  def set_game
    @game = Game.find(params[:game_id])
  end
end
