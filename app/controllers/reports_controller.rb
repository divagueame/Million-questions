class ReportsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @reports = current_user.reports
  end
end
