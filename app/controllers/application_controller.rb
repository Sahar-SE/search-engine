class ApplicationController < ActionController::Base
    include TrackSearch
    before_action :start_analytics
end