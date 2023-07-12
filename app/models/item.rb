class Item < ApplicationRecord
  validates :price, numericality: {gteater_than: 0}
  validates :name , presence: true


  belongs_to :seller
  
  has_many :items_orders
  has_many :orders, through: :items_orders

  has_many :carts_items
  has_many :carts, through: :carts_items

  has_many :comments, as: :commentable
  #has_and_belongs_to_many :carts
end
