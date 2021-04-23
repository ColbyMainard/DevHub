class Post < ApplicationRecord
    belongs_to :user, optional: true
    has_many :votes, :dependent => :destroy
    has_many :votants, through: :votes
    
    def self.search_by_user(username)
        user = User.find_by_username(username)
        if user
            return Post.where(user_id: user)
        else
            return nil
        end
    end
    
    def self.search_by_keyword(keyword)
        # find the posts whose title includes the keyword
        return Post.where("post_title like ?", "%#{keyword}%")
        
        # keyword in post description?
    end
end
