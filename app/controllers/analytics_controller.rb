class AnalyticsController < ApplicationController
  def index
    @analytics = Search.searches_ordered_limited
  end
end
