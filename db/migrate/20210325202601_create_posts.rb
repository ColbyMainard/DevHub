class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :username
      t.string :post_title
      t.string :post_description
      t.string :project_motivation
      t.string :github_repo_link
      t.timestamp :post_time
      t.string :video_link

      t.timestamps
    end
  end
end
