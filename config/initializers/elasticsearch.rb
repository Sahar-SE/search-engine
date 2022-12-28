require "elasticsearch"

if Rails.env.development?
    SearchClient = Elasticsearch::Model.client = Elasticsearch::Client.new url: ENV['BONSAI_URL']
  end

if Rails.env.production?
    SearchClient = Elasticsearch::Model.client = Elasticsearch::Client.new url: ENV['BONSAI_URL']
end