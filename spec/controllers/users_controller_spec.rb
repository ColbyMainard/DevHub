require 'rails_helper'
RSpec.describe UsersController, type: :controller do
    #put UsersController spec tests here
    describe UsersController do

        #tests for admin page - implement later
        it "redirects user if not logged in" do
        end

        #tests for admin page - implement later
        it "non-admin users cannot access moderator page" do
        end
        
        #tests for admin page - implement later
        it "allows user to access if admin" do
        end

        it "GET #create" do
            get :create "", "Test_User_03q4u82305", "testemail@gmail.com", "testpassword", "testpassword", "colbymainard#3777", "colbymainard", "https://github.com/ColbyMainard/"
            expect(response).to be_successful
        end

        it "GET #index" do
            get :index
            expect(response).to be_successful
        end

        it "GET #show" do
            get :show 1
            expect(response).to be_successful
        end

        it "GET #destroy" do
            get :destroy
            expect(response).to be_successful
        end
    end
end