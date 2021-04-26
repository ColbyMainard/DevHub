class Search < ApplicationRecord
    self.inheritance_column = "not_sti"
    
    def search_posts
        posts = Post.all 

        posts = posts.where(['username LIKE ?', "%#{username}%"]) if username.present?
        
        # Search a post related to a specific topic by checking if its topic and motivation mentions the topic word
        posts = posts.where('post_title LIKE :topic_word OR project_motivation LIKE :topic_word',  topic_word: "%#{topic}%") if topic.present?
        
        # Search a keyword in post title, motivation and description as well
        posts = posts.where('post_title LIKE :keyword OR project_motivation LIKE :keyword OR post_description LIKE :keyword',  keyword: "%#{keyword}%")if keyword.present?

        return posts
    end 
end
