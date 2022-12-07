class PagesController < ApplicationController
  include TrackSearch
  before_action :start_analytics,:track_search , only: :search


  def search
    @most_searched = Search.searches_ordered_limited
    @articles = Article.where("name LIKE ?", "%#{params[:search]}%")
    @visitor_recent_search = Visitor.find(session[:visitor_id]).searches.last(4)
  end
  # def sign_in
  #   @user = User.find_by!(email: params[:user][:email])
  #   Current.visitor.presence && Current.visitor.update!(user: @user)

  #   redirect_to root_path
  # end

  # def sign_up
  #   @user = User.create!(params.require(:user).permit(:email))
  #   Current.visitor.presence && Current.visitor.update!(user: @user)

  #   redirect_to root_path
  # end
end
