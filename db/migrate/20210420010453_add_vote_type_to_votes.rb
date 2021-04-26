class AddVoteTypeToVotes < ActiveRecord::Migration[6.1]
  def change
    add_column :votes, :vote_type, :integer
  end
end
