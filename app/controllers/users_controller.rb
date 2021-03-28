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
        verifyInput params
    end

    def verifyInput params
        #checks that all parts of user login information is of proper format
        if not UsersHelper.valid_username? params[""]
            flash[:notice] = "Username not valid. Try different combinations of length and remove special characters."
            return false
        end
        #valid username - username must be a valid combination of alphanumeric characters and underscores. All other characters are to be treated as invalid
        if not UsersHelper.valid_username? params["username"]
            flash[:notice] = "Username not valid. Try different combinations of length and remove special characters."
            return false
        end
        #password - valid combination of alphanumeric characters, underscores, and non-quote special characters
        if not UsersHelper.valid_password? params["password"]
            flash[:notice] = "Password not valid."
            return false
        end
        #verification of password - must be equal to password above
        if not params[:password].eql? params["vPassword"]
            flash[:notice] = "Password and confirmation of password do not match."
            return false
        end
        #email - where to go for password reset
        if not UsersHelper.valid_email? params["email"]
            flash[:notice] = "Email address not recognized."
            return false
        end
        #socials
        if not UsersHelper.valid_social? params["discord_username"]
            flash[:notice] = "Discord username not recognized."
            return false
        end
        if not UsersHelper.valid_social? params["instagram_handle"]
            flash[:notice] = "Discord username not recognized."
            return false
        end
        return true
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
            #@user = User.find(params[:id])
            @user = User.find(params[:username])
        end
        def user_params
            #Verify user parameters, because internet people be spooky
            params.require(:user).permit(:profile_picture_link, :username, :email, :password, :vPassword, :discord_username, :instagram_handle, :github_link)
        end
end
