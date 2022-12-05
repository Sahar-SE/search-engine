class AnalyticsController < ApplicationController
  
  def enable
    session[:enable_analytics] = true
  end
end
