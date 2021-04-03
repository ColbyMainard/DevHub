class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :profile_picture_link
      t.string :username
      t.string :email
      t.string :password
      t.string :discord_username
      t.string :instagram_handle
      t.string :github_link
      t.boolean :is_admin

      t.timestamps
    end
    add_index :users, :username, unique: true
  end
end
