class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :post

  enum selectable_vote_types: [ :downvote, :upvote ]

  def self.total_upvote(post_id)
  	return Vote.where(:post_id => post_id, :vote_type => 1).distinct.count('user_id')
  end

  def self.total_downvote(post_id)
  	return Vote.where(:post_id => post_id, :vote_type => 0).distinct.count('user_id')
  end

end
