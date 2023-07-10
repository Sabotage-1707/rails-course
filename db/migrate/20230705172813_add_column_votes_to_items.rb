class AddColumnVotesToItems < ActiveRecord::Migration[7.0]
  def change
    add_column :items, :votes ,:integer, default: 0
  end
end
