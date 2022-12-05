class Search < ApplicationRecord
  belongs_to :visitor

  #return array of objects with params and count
  def self.searches
    select(:params)
      .where(path: "/search")
      .group(:params)
      .count
      .map do |name, count|
      {name: name, count: count}
      end
  end
  
end
