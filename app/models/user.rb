class User < ApplicationRecord
  has_secure_password
  has_many :visits, class_name: "Visitor"
  has_many :searches, through: :visits,  dependent: :destroy
end
