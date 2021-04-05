class PostsController < ActionController::Base
    #Posts controller methods will go here
    skip_before_action :verify_authenticity_token
    before_action :set_post, only: [:show, :edit, :update, :destroy]
    def index
        @posts = Post.all
        @posts = @posts.paginate(page: params[:page], per_page: 3)
    end
    def show
        #gets an individual post
        @post = Post.find(params[:id])
    end
    def new
        #create a new post
    end
    def edit
        #edits a given post
        @post = Post.find(params[:id])
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
        @post = Post.find(params[:id])
        @post = Post.update(post_params)
        #flash[:notice] = "#{@post.title} was successfully updated."
        redirect_to controller: 'posts', action: 'index'
    end
    def destroy
        #deletes a post
    end
    private
        def set_post
            #determine which post is being acted on
        end
        def post_params
            #the internet is scary
            params.require(:post).permit(:post_title, :post_description, :project_motivation, :github_repo_link, :video_url)
        end
end