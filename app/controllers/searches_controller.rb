class SearchesController < ApplicationController
    def show
        @search = Search.find(params[:id])
        @posts = @search.search_posts
        @posts = @posts.paginate(page: params[:page], per_page: 3)
    end 

    def new 
        @search = Search.new
        @topics = Post.distinct.pluck(:topic)
    end

    def create
        @search = Search.create(search_params)
        redirect_to controller: 'searches', action: 'show', id: @search.id
    end 
    
    def destroy
        
        #deletes a search history
        @search = Search.find(params[:id])
        @search.destroy
        redirect_to controller: 'posts', action: 'index'
    end 
    
    private

    def search_params
        params.require(:search).permit(:username, :keyword, :topic)
    end 
end
