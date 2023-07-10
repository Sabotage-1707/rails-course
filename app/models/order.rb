class Order < ApplicationRecord
  belongs_to :user
  belongs_to :seller
  has_many :items
end
