class Order < ApplicationRecord
  belongs_to :user

  belongs_to :seller

  has_many :items_orders
  has_many :items, through: :items_orders

  def calculates_total
    write_attribute :total, items.map(&:price).inject(:+)
  end
end
