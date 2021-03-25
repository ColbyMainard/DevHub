class User < ApplicationRecord
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    has_many :posts, :dependent => :destroy
    def index
        #redirect to list of all user accounts.
    end
    
    def show
        #redirect to current user profile
    end

    def new
        @user = User.new
    end

    def edit
        #called when editing an existing user
    end

    def create
        #called when creating a new user
    end
    
    def verifyInput params
        #checks that user input valid information when editing or creating a new user
    end
    
    def update
        #updates a specified user
    end
    
    def destroy
        #deletes a specified user
    end
    
    def moderator_portal
        #if a user is not signed in as a moderator, redirect them to the homepage
        if current_user.nil?
            return redirect_to root_path
        elsif not current_user.is_admin
            return redirect_to root_path
        end
    end
    
    def admin
        #gives existing user admin/moderator priviledges
    end
    private
        def set_user
            #if a user is logged in, find out which user
            #@user = User.find(params[:id])
        end
        
        def user_params
            #check user parameters
        end
end
