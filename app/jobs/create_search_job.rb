class CreateSearchJob < ApplicationJob
  queue_as :default

  def perform(visitor:,params:)
      time= 12.seconds.ago
      search = visitor.searches.where("params LIKE ?", params[0] + "%").where("created_at > ? OR updated_at > ?", time,time)
      if search.present?
        search.update!(params: params)
      else
        visitor.searches.create!(params: params)
      end
  end
end



