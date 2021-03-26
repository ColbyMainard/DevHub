class User < ApplicationRecord
    attr_accessor :vPassword
    has_secure_password
    validates :email, presence: true, uniqueness: true
    def is_admin
        #if the user is a moderator, return true
        #return false if not logged in or not moderator
        return false #this is just to return a dummy value until fully implemented
    end
end
