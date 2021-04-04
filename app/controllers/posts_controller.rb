class PostsController < ActionController::Base
    #Posts controller methods will go here
    before_action :set_review, only: [:show, :edit, :update, :destroy]
    def index
        #gets all posts
    end
    def show
        #gets an individual post
    end
    def new
        #create a new post
    end
    def edit
        #edits a given post
        @post = Post.find(params[:id])
    end
    def post_list
        #list of all existing posts
    end
    def create
        #creates a new controller
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
        def post_params
            #the internet is scary
            params.require(:post).permit(:title, :project_status, :project_motivation, :github_repo, :youtube_video)
        end
end