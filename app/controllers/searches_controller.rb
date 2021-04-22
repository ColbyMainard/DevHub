class SearchesController < ApplicationController
    def show
        @search = Search.find(params[:id])
        @posts = @search.search_posts
    end 

    def new 
        @search = Search.new
        @topics = Post.distinct.pluck(:topic)
    end

    def create
        @search = Search.create(search_params)
        redirect_to controller: 'searches', action: 'show', id: @search.id
    end 
    
    private

    def search_params
        params.require(:search).permit(:username, :keyword, :topic)
    end 
end
