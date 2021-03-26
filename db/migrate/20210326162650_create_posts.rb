class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :username
      t.string :post_title
      t.string :post_description
      t.string :project_motivation
      t.string :github_repo_link
      t.string :video_url
      t.timestamps
    end
    add_index :posts, :username
    add_index :posts, :post_title
  end
end
