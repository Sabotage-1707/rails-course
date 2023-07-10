class AddColumnSellerIdToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :seller_id , :integer, default: 1
  end
end
