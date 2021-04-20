module UsersHelper
    def same_user(user)
        @user = User.find_by(id: session[:user_id])
        #puts "params"
        #puts params[:id]
        #puts "session"
        #puts session[:user_id]
        @user1= User.find(user.id)
        #puts @user1.id
        #puts @user.id
        return @user1==@user
        
    end
end