class GameController < ApplicationController
  before_action :authenticate_user!

  def index
    redirect_to game_report_path if current_user.game_ended
  end

  def report
    redirect_to game_path if !current_user.game_ended
  end

  def destroy
    if current_user.game_ended
    @game = Game.find_by(user_id: current_user.id)
    @game.destroy
    message = "Good luck this time!"
    else
      message = "Keep going"
    end
    redirect_to game_path, notice: message
    
  end


  private

  def set_game
    @game = Game.find(current_user.game.id)
  end

  def game_params
    params.require(:game).permit(:is_playing, :user_id)
  end


end
