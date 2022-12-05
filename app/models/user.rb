class User < ApplicationRecord
  has_many :visits, class_name: "Visitor"
  has_many :events, through: :visits
end
