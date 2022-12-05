module TrackSearch
  extend ActiveSupport::Concern

  def track_search
    if session[:enable_analytics] == true
      CreateSearchJob.perform_later(
        visitor: Current.visitor,
        params: event_params
      )
    end
  end

  def start_analytics
    session[:enable_analytics] = true
  end

  private

  def filter_sensitive_data(params)
    return if params.nil?

    ActiveSupport::ParameterFilter.new(
      Rails.application.config.filter_parameters
    ).filter(params)
  end

  def event_params
    params[:search] || filter_sensitive_data(request.request_parameters.presence)
  end
end