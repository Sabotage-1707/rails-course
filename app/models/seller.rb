class Seller < ApplicationRecord
  has_many :items, dependent: :destroy
  has_many :comments, as: :commentable
end
