class ScoreboardController < ApplicationController
  def index
    
    top_answers = Answer.top(10)
    users_ids = top_answers.to_h.keys
    @top_10_users = User.find(users_ids)
    
  end
end