class AddDescriptionTextToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :description_text, :text
  end
end
