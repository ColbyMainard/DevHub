require 'rails_helper'
RSpec.describe PostsController, type: :controller do
    #put PostsController spec tests here
    describe PostsController do
        it "GET #create" do
            post :create, params: {post_title: 'title1', post_description: 'description', project_motivation: 'motivation', github_repo_link: 'www.github.com', video_url: 'www.youtube.com', uploaded_time: '2021-04-25'}
            expect(flash[:notice]).to eq "title1 was successfully created"
            expect(response).to redirect_to root_path
        end
        it "GET #show" do
            post1 = Post.create!(post_title: 'title1')
            get :show, params: { id: post1.to_param}
            expect(assigns(:post)).to eq post1
        end
        it "GET #index" do
            get :index
            expect(assigns(:posts).length).to eq(Post.all.count)
        end
        it "#GET #destroy" do
            post1 = Post.create!(post_title: 'title1')
            delete :destroy, params: { id: post1.id }
            expect(flash[:notice]).to eq "Post 'title1' was successfully deleted."
            expect(response).to redirect_to root_path
        end
        it "GET #update" do
            post1 = Post.create!(post_title: 'title1')
            post1.update_attribute(post_title: 'new title')

            put :update, params: { id: post1.id, post: post1.attributes }
            expect(assigns(:post)).to eq post1
            expect(flash[:notice]).to eq "new title was successfully updated."
            expect(response).to redirect_to root_path
        end
        it "GET #edit" do
            post1 = Post.create!(post_title: 'title1')

            get :edit, params: { id: post1.to_param }
            expect(assigns(:post)).to eq post1
        end
    end
end