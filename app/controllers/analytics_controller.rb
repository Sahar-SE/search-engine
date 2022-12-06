class AnalyticsController < ApplicationController
  
  def enable
    session[:enable_analytics] = true
  end 

  def index
    @analytics = Search.searches_ordered_limited
  end
end
