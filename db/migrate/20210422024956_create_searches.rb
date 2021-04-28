class CreateSearches < ActiveRecord::Migration[6.1]
  def change
    create_table :searches do |t|
      t.string :username
      t.string :topic
      t.string :keyword

      t.timestamps
    end
  end
end
