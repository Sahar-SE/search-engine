class Visitor < ApplicationRecord
  belongs_to :user, optional: true
  has_many :searches

  def self.last_search_params
    searches.last
  end
end
