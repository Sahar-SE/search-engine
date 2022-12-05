class Visitor < ApplicationRecord
  belongs_to :user, optional: true
  has_many :searches
end
