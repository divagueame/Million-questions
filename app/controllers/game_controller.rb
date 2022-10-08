class GameController < ApplicationController
  before_action :authenticate_user!
  def index
  end

  def report
  end


  private

  def set_game
    @question = Question.find(params[:question_id])
  end


  def game_params
    params.require(:game).permit(:is_playing, :user_id)
  end


end
