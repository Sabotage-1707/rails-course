class Item < ApplicationRecord
  validates :price, numericality: {gteater_than: 0}
  validates :name , presence: true
end
