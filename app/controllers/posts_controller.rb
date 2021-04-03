class PostsController < ActionController::Base
    #Posts controller methods will go here
    before_action :set_post, only: [:show, :edit, :update, :destroy]
    def index
        @posts = Post.all
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
        def post_params params
            #the internet is scary
        end
end