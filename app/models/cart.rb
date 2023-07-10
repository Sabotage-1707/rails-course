class Cart < ApplicationRecord
  belongs_to :user, optional: true

  has_many :carts_items
  has_many :items, through: :carts_items
  #has_and_belongs_to_many :items
end
