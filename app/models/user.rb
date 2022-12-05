class User < ApplicationRecord
  has_many :visits, class_name: "Visitor"
  has_many :searches, through: :visits
end
