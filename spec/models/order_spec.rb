require 'rails_helper'

RSpec.describe Order, type: :model do
  it{should belong_to :user}
  it{should belong_to :seller}
  it{should have_many :items}

  context "calculates price" do
    let!(:seller1){create :seller}
    let!(:user1){create :user}
    let!(:item1){create :item, price: 20.3, seller: seller1}
    let!(:item2){create :item, price: 23.4, seller: seller1}
    let!(:order1){create :order, seller:seller1, user: user1}

    it "calculates price" do
    order1.items << item1
    order1.items << item2

     expect(order1.calculates_total).to be 43.7
  end
  end
end
