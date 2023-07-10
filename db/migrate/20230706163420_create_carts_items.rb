class CreateCartsItems < ActiveRecord::Migration[7.0]
  def change
    create_table :carts_items do |t|
      t.belongs_to :cart
      t.belongs_to :item
      
      t.timestamps
    end
  end
end
