class ScoreboardController < ApplicationController
  def index

    
    @top_10_reports = Report.highest.first(10)
  end
end