class CreateSearchJob < ApplicationJob
  queue_as :default

  def perform(visitor:,params:)
      search = visitor.searches.where(params: params.chop).where("created_at > ?", 10.second.ago) || visitor.searches.sanitize_sql_like(params + "%").where("created_at > ?", 10.second.ago)
      if search.present?
        search.update(params: params)
      else
        visitor.searches.create!(params: params)
      end
  end
end