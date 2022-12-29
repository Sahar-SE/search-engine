class Search < ApplicationRecord
  belongs_to :visitor
  has_one :movie, class_name: "Movie", foreign_key: "id", primary_key: "movie_id"
  
  #return array of objects with params and count
  def self.searches
    select(:params)
      .group(:params)
      .count
      .map do |name, count|
      {name: name, count: count}
      end
  end
  # return array of ojects with params and count ordered by count
  def self.searches_ordered
    searches.sort_by { |hsh| hsh[:count] }.reverse
  end
# return array of ojects with params and count ordered by count limited to 5
  def self.searches_ordered_limited
    searches_ordered[0..4]
  end


  #return current visitor last search params
  def self.last_search_params
    last_search.params
  end
  
  def self.last_search_param
    searches.order created_at: :desc 
  end
end
