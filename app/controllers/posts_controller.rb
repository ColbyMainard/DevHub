class PostsController < ActionController::Base
    #Posts controller methods will go here
    before_action :set_post, only: [:show, :edit, :update, :destroy]
    def index
        # search by User or Keyword, according to which checkbox is checked.
        if params[:search] && params[:checkbox]
            if (params[:checkbox] == "username")
                @posts = Post.search_by_user(params[:search])
            elsif (params[:checkbox] == "keyword")
                @posts = Post.search_by_keyword(params[:search])
            end
            if (@posts.nil?)
                # @posts = Post.all
                flash[:notice] = "No matching post!"
                redirect_to controller: 'posts', action: 'index'
                return
            end
        else
            @posts = Post.all
        end

        if params[:order]
            sorted = params[:order]
        end

        if sorted
            if sorted == 'uploaded_time'
                ordered, @uploaded_time_header = {:uploaded_time => :asc}
            elsif sorted == 'title'
                ordered, @title_header = {:post_title => :asc}
            end
        end
        
        @posts = @posts.order(ordered)
        @posts = @posts.paginate(page: params[:page], per_page: 3)
    end
    def show
        #gets an individual post
        @post = Post.find(params[:id])

        # List of choices to vote
        @vote_choices = Vote.selectable_vote_types

        # Count of upvote and downvote by distinct user
        @total_upvote = Vote.total_upvote(params['id'])
        @total_downvote = Vote.total_downvote(params['id'])
        
    end
    def new
        #create a new post
    end
    def edit
        #edits a given post
        @post = Post.find(params[:id])
    end
    def create
        # login or not?
        if session[:user_id].nil?
            redirect_to controller: 'sessions', action: 'new'
            return
        end
        
        # #creates a new controller
        # if params['post']['username'].nil?
        #     params['post']['username'] = 'FNU'
        # end
        
        params.permit!
        @post = Post.create!(params['post'])
        # add the user_id and username who is logged in
        @post.user_id = session[:user_id]
        @post.username = session[:username]
        # @post.username = User.find(session[:user_id]).username
        @post.save
        
        flash[:notice] = "#{@post.post_title} was successfully created"
        redirect_to controller: 'posts', action: 'index'
        
        #@post = Movie.create!(movie_params)
        #flash[:notice] = "#{@movie.title} was successfully created."
        #redirect_to movies_path

    end
    def update
        #updates a post after an edit
        @post = Post.find(params[:id])
        @post = @post.update(post_params)
        flash[:notice] = "#{@post=>post_title} was successfully created"
        redirect_to controller: 'posts', action: 'index'
    end
    def destroy
        #deletes a post
        @post = Post.find(params[:id])

        # Checks if logged in user and the post's created user are the same
        if session['username'] == @post.username
            @post.destroy
            flash[:notice] = "Post '#{@post.post_title}' was successfully deleted."
        else
            flash[:notice] = "Failed: You do not have permission to delete '#{@post.post_title}'"
        end

                    
        redirect_to controller: 'posts', action: 'index'
    end
    
    private
        def set_post
            #determine which post is being acted on
        end
        def post_params
            #the internet is scary
            params.require(:post).permit(:post_title, :post_description, :project_motivation, :github_repo_link, :video_url, :uploaded_time)
        end
end