class Post < ApplicationRecord
    belongs_to :user, optional: true
    
    def self.search(username)
        user = User.find_by_username(username)
        if user
            return Post.where(user_id: user)
        else
            return nil
        end
    end
end
