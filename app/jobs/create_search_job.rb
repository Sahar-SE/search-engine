class CreateSearchJob < ApplicationJob
  queue_as :default

  def perform(visitor:,params:)
      search = visitor.searches.where("params LIKE ? AND created_at > ?", "#{params.strip.chop}%", 10.second.ago)
      if search.present?
        search.update(params: params)
      else
        visitor.searches.create!(params: params)
      end
  end
end
