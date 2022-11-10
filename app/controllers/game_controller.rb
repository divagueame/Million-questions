class GameController < ApplicationController
  before_action :authenticate_user!

  def index

    @game = Game.find_or_create_by(user_id: current_user.id)
    redirect_to game_report_path if current_user.game&.ended
    
    questions_left = current_user.unanswered_questions
    
    if questions_left.any?
      @question = questions_left.first
      @answer = @question.answers.build
    end
  end

  def report
    redirect_to game_path unless current_user.game.ended
    @user_answers = Answer.where(user_id: current_user.id)
  end
  
  def finish
    current_user.game.update(ended: true)
    # current_user.game.create_report
    redirect_to game_report_path
  end

  def destroy
    if current_user.game.ended
      @game = Game.find_by(user_id: current_user.id)
      @game.destroy!
      message = 'Good luck this time!'
    else
      message = 'Keep going'
    end
    redirect_to game_path, notice: message
  end

  private

  def set_game
    @game = Game.find(current_user.game.id)
  end

  def game_params
    params.require(:game).permit(:ended, :user_id)
  end
end
