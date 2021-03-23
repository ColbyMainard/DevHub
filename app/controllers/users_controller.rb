class UsersController < ActionController::Base
    #Users controller methods will go here
    before_action :set_user, only: [:show, :edit, :update, :destroy]
    layout false

    def index
        #gets list of all users
        #should only be available when logged in as an admin
    end

    def show
        #shows information on a particular user
    end

    def new
        #creates a new default user
    end

    def edit
        #allows for editing a particular user
    end

    def create
        #creates a new user
    end

    def verifyValidUserArgs params
        #checks that all parts of user login information is of proper format
        #Things to check:
        #valid username - username must be a valid combination of alphanumeric characters and underscores. All other characters are to be treated as invalid
        #password - valid combination of alphanumeric characters, underscores, and non-quote special characters
        #verification of password - must be equal to password above
        #email - where to go for password reset
    end

    def update
        #update user, if they exist
        #else, return an error message and redirect them to homepage
    end

    def destroy
        #deletes a particular user if they exist
        #return an error message and redirect to home page otherwise
    end

    def admin_portal
        #if a user is not logged in or is not moderator, send them back to home page and tell them "Silly user: admin priviledges are for moderators"
    end

    def admin
        # creates new moderator
    end

    private
        def set_user
            #sets which user is currently logged in
            @user = User.find(params[:id])
        end
        def user_params
            #Verify user parameters, because internet people be spooky
        end
end
