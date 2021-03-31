class User < ApplicationRecord
    has_many :posts, :dependent => :destroy
    attr_accessor :vPassword
    validates :email, presence: true
    validates :username, presence: true, uniqueness: true
    validates :password, presence: true
    def is_admin
        #if the user is a moderator, return true
        #return false if not logged in or not moderator
        return false #this is just to return a dummy value until fully implemented
    end
end
