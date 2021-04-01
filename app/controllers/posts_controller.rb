class PostsController < ActionController::Base
    #Posts controller methods will go here
    before_action :set_review, only: [:show, :edit, :update, :destroy]
    def index
        @posts = Post.all
    end
    def show
        #gets an individual post
    end
    def new
        #create a new post
    end
    def edit
        #edits a given post
    end
    def create
        #creates a new controller
        if params['post']['username'].nil?
            params['post']['username'] = 'FNU'
        end
        params.permit!
        @post = Post.create!(params['post'])
        flash[:notice] = "#{@post.post_title} was successfully created"
        redirect_to controller: 'posts', action: 'index'

        #@post = Movie.create!(movie_params)
        #flash[:notice] = "#{@movie.title} was successfully created."
        #redirect_to movies_path
    end
    def update
        #updates a post after an edit
    end
    def destroy
        #deletes a post
    end
    private
        def set_post
            #determine which post is being acted on
        end
        def post_params params
            #the internet is scary
        end
end