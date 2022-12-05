module TrackSearch
  extend ActiveSupport::Concern

  def track_search
    if session[:enable_analytics] == true
      CreateEventJob.perform_later(
        visitor: Current.visitor,
        method: request.method,
        params: event_params
      )
    end
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