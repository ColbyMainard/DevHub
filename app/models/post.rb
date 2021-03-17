class Post < ApplicationRecord
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
    private
        def set_post
            @post = Post.find(params[:id])
        end
        
        def post_params
            #check user parameters
        end
end
