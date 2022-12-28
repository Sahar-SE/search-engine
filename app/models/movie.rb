class Movie < ApplicationRecord
    include Searchable
    has_many :searches, dependent: :destroy
end
