class AddPostIdToPost < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :post_id, :integer
    add_index :posts, :post_id, unique: true
  end
end
