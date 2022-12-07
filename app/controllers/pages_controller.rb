class PagesController < ApplicationController
  include TrackSearch
  include SetCurrentVisitor
  before_action :track_search, only: [:search]

  def search
    @most_searched = Search.searches_ordered_limited
    @articles = Article.where("name LIKE ?", "%#{params[:search]}%")
  end

  def history
    @visitor_recent_search = Visitor.find(session[:visitor_id]).searches.last(4)
  end
end
