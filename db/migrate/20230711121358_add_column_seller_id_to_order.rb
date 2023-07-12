class AddColumnSellerIdToOrder < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :seller_id, :integer
  end
end
