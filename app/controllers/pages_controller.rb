class PagesController < ApplicationController
  include TrackSearch
  include SetCurrentVisitor
  before_action :track_search, only: [:search]
  before_action :update_actual_search, only: [:show]

  def search
    @most_searched = Search.searches_ordered_limited
    query = params[:search] || ""
    @results = Movie.search(query).results
  end
  
  def show
    @movie = Movie.find(params[:id])
  end

  def history
    @visitor_recent_search = Current.visitor.searches.includes(:movie).order(created_at: :desc).limit(10)
  end

  def sign_in
  end
end
