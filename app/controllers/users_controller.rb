class UsersController < ActionController::Base
    #Users controller methods will go here
    before_action :set_user, only: [:index, :show, :edit, :update, :destroy]
    #layout false

    def index
        @users = User.all
        #gets list of all users
        #should only be available when logged in as an admin
    end

    def show
        #shows information on a particular user
        if session[:user_id].nil?
            redirect_to(root_url, :notice => 'Not logged in. Cannot show your account.')
        end 
        
        # begin
        #     @user = User.find(session[:user_id])
        # rescue
        #     redirect_to(root_url, :notice => 'Not logged in. Cannot show your account.')
        # end
        puts "here"
        puts params[:id]
        if User.find_by_username(params[:id]).nil?
            @user=User.find(session[:user_id])
        else
            @user=User.find_by_username(params[:id])    
        end
        
        #puts @user.id
    end

    def new
        #creates a new default user
    end

    def edit
        #allows for editing a particular user
        @user = User.find(params[:id])
    end
    
    def update
        #update user, if they exist
        @user = User.find(session[:user_id])
        if @user.update(user_params)
            # Handle a successful update.
        redirect_to(show_user_path(@user.username), :notice => 'Your profile was successfully updated.') 
     else
           flash[:notices] = ["Your profile could not be updated"]
           redirect_to action: "edit"
        end
    end

    def create
        #creates a new user
        if verifyInput(user_params)
            @user = User.new(profile_picture_link: user_params["profile_picture_link"], username: user_params["username"], email: user_params["email"], password: user_params["password"], discord_username: user_params["discord_username"], email: user_params["email"], instagram_handle: user_params["instagram_handle"], github_link: user_params["github_link"], is_admin: false)
            respond_to do |format|
                if @user.save
                    session[:username] = @user.username
                    session[:user_id] = @user.id
                    format.html { redirect_to root_url, notice: "Logged in!" }
                else
                    format.html { render :new }
                    format.json { render json: @user.errors, status: :unprocessable_entity }
                    flash[:notice] = "Error creating account."
                    print("Error Creating User")
                    format.html { redirect_to action: "new"}
                end
            end
        else
            respond_to do |format|
                format.html { redirect_to action: "new"}
            end
        end
    end

    def verifyInput params
        #checks that all parts of user login information is of proper format
        if not valid_link? params["profile_picture_link"]
            flash[:notice] ="Profile link not valid. Try different combinations of length and remove special characters."
            return false
        end
        #valid username - username must be a valid combination of alphanumeric characters and underscores. All other characters are to be treated as invalid
        if not valid_username? params["username"]
            flash[:notice] = "Username not valid. Try different combinations of length and remove special characters."
            return false
        end
        #password - valid combination of alphanumeric characters, underscores, and non-quote special characters
        if not valid_password? params["password"]
            flash[:notice] = "Password not valid."
            return false
        end
        #verification of password - must be equal to password above
        if not params[:password].eql? params["vPassword"]
            flash[:notice] = "Password and confirmation of password do not match."
            return false
        end
        #email - where to go for password reset
        if not valid_email? params["email"]
            flash[:notice] = "Email address not recognized."
            return false
        end
        #socials
        if not valid_social? params["discord_username"]
            flash[:notice] = "Discord username not recognized."
            return false
        end
        if not valid_social? params["instagram_handle"]
            flash[:notice] = "Ins username not recognized."
            return false
        end
        if not valid_link? params["github_link"]
            flash[:notice] = "github link not valid. Try different combinations of length and remove special characters."
            return false
        end
        return true
    end

    def destroy
        #deletes a particular user if they exist
        #return an error message and redirect to home page otherwise
        #
        #puts session[:user_id]
        @user = User.find(session[:user_id])
        #puts "sdfsd",params[:id]
        #puts "strtrt"
        #@user1= User.find(params[:id])
        #puts @user1.id
        #puts @user1==@user
        #if @user1 != @user
            
        #end
        @user.destroy
        flash[:notice] = "User '#{@user.username}' deleted."
        session[:user_id] = nil
        redirect_to root_url
    end

    def admin_portal
        #if a user is not logged in or is not moderator, send them back to home page and tell them "Silly user: admin priviledges are for moderators"
    end

    def admin
        # creates new moderator
    end

    def valid_username? name
        #if username provided is made up of valid alphanumeric characters and of valid length, return true
        #else, return false
        uppercase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        lowercase = "abcdefghijklmnopqrstuvwxyz"
        numeric = "1234567890"
        underscore = "_"
        dash = "-"
        valid_special_characters = "~!@#$%^&*()_-+=[{]}|<>?"
        single_quotes = "\'"
        double_quotes = "\""
        if name.length < 7
            return false
        end
        if name.length > 30
            return false
        end
        for index in 0..name.length
            is_uppercase_letter = uppercase.include? name[index].to_s
            is_lowercase_letter = lowercase.include? name[index].to_s
            is_digit = numeric.include? name[index].to_s
            is_underscore = underscore.include? name[index].to_s
            if not (is_digit || is_lowercase_letter || is_uppercase_letter || is_underscore)
                return false
            end
        end
        return true
    end
    
    def valid_password? password
        uppercase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        lowercase = "abcdefghijklmnopqrstuvwxyz"
        numeric = "1234567890"
        underscore = "_"
        dash = "-"
        valid_special_characters = "~!@#$%^&*()_-+=[{]}|<>?"
        single_quotes = "\'"
        double_quotes = "\""
        if password.length < 10
            return false
        end
        if password.length > 30
            return false
        end
        for index in 0..password.length
            is_uppercase_letter = uppercase.include? password[index].to_s
            is_lowercase_letter = lowercase.include? password[index].to_s
            is_digit = numeric.include? password[index].to_s
            is_underscore = underscore.include? password[index].to_s
            is_special = valid_special_characters.include? password[index].to_s
            if not (is_digit || is_lowercase_letter || is_uppercase_letter || is_underscore || is_special)
                return false
            end
        end
        return true
    end
    
    def valid_social? social_handle
        uppercase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        lowercase = "abcdefghijklmnopqrstuvwxyz"
        numeric = "1234567890"
        underscore = "_"
        dash = "-"
        valid_special_characters = "~!@#$%^&*()_-+=[{]}|<>?"
        single_quotes = "\'"
        double_quotes = "\""
        if social_handle.length == 0
            return true
        end
        for index in 0..social_handle.length
            is_uppercase_letter = uppercase.include? social_handle[index].to_s
            is_lowercase_letter = lowercase.include? social_handle[index].to_s
            is_digit = numeric.include? social_handle[index].to_s
            is_underscore = underscore.include? social_handle[index].to_s
            is_special = valid_special_characters.include? social_handle[index].to_s
            is_dash = dash.include? social_handle[index].to_s
            if not (is_digit || is_lowercase_letter || is_uppercase_letter || is_underscore || is_special || is_dash)
                return false
            end
        end
        return true
    end
    
    def valid_email? email
        uppercase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        lowercase = "abcdefghijklmnopqrstuvwxyz"
        numeric = "1234567890"
        underscore = "_"
        dash = "-"
        valid_special_characters = "~!@#$%^&*()_-+=[{]}|<>?"
        single_quotes = "\'"
        double_quotes = "\""
        valid_email_endings = ["@gmail.com", "@yahoo.com", "@hotmail.com", "@aol.com", "@hotmail.com", "@verizon.net", "@msn.com", "@aim.com"]
        end_is_valid = false
        for index in 0..valid_email_endings.length
            if email.include? valid_email_endings[index].to_s
                if not end_is_valid
                    end_is_valid = true
                end
            end
        end
        if not end_is_valid
            return false
        end
        if not (email.length > 11)
            return false
        end
        if email.include? single_quotes.to_s
            return false
        end
        if email.include? double_quotes.to_s
            return false
        end
        return true
    end
    
    def valid_link? link
        uppercase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        lowercase = "abcdefghijklmnopqrstuvwxyz"
        numeric = "1234567890"
        underscore = "_"
        dash = "-"
        valid_special_characters = "~!@#$%^&*()_-+=[{]}|<>?"
        single_quotes = "\'"
        double_quotes = "\""
        if ((link.index("http://") == 0) and (link.length > 7))
            return true 
        end
        if ((link.index("https://") == 0) and (link.length > 8))
            return true 
        end
        return (link.length == 0)  #it is okay to leave a link blank, but not 
    end

    private
        def set_user
            #sets which user is currently logged in
            # @user = User.find(params[:id])
            # @user = User.find(params[:username])
        end

        def user_params
            #Verify user parameters, because internet people be spooky
            params.require(:user).permit(:profile_picture_link, :username, :email, :password, :vPassword, :discord_username, :instagram_handle, :github_link)
        end
end

