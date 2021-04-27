class User < ApplicationRecord
    has_many :posts, :dependent => :destroy
    has_many :votes, :dependent => :destroy
    has_many :liked_posts, through: :votes
    attr_accessor :vPassword, :reset_token
    validates :email, presence: true
    validates :username, presence: true, uniqueness: true
    #validates :password, presence: true
    has_secure_password
    def is_admin
        #if the user is a moderator, return true
        #return false if not logged in or not moderator
        return false #this is just to return a dummy value until fully implemented
    end
    
    def create_reset_digest
        self.reset_token = User.new_token
        update_attribute(:password_digest,  User.digest(reset_token))
    end

  # Sends password reset email.
    def send_password_reset_email
        UserMailer.password_reset(self).deliver_now
    end
    
    def User.new_token
        SecureRandom.urlsafe_base64
    end
    
    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
  end
end
