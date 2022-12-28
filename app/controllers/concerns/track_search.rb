module TrackSearch
  extend ActiveSupport::Concern

  def track_search
    if session[:enable_analytics] == true
      return if event_params.blank? 
      CreateSearchJob.perform_later(
        visitor: Current.visitor,
        params: check(event_params)
      )
    end
  end

  def update_actual_search
    UpdateSearchJob.perform_later(
      visitor: Current.visitor,
      params: movie_params
    )
  end

  def start_analytics
    session[:enable_analytics] = true
  end

  private

 
  def  check(param)
    return if param.blank? 
    param
 end 

  def filter_sensitive_data(params)
    return if params.nil?
    ActiveSupport::ParameterFilter.new(
      Rails.application.config.filter_parameters
    ).filter(params)
  end

  def event_params
    params[:search]|| filter_sensitive_data(request.request_parameters.presence)
  end

  def movie_params
    params[:id]
  end
end