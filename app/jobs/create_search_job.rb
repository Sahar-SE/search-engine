class CreateSearchJob < ApplicationJob
  queue_as :default

  def perform(visitor:,params:)
    visitor.searches.create!(
      params: params
    )
  end
end
