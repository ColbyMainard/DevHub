require 'rails_helper'
RSpec.describe UsersController, type: :controller do
    #put UsersController spec tests here

    #tests for admin page - implement later
    describe UsersController do
        it "redirects user if not logged in" do
        end
        it "non-admin users cannot access moderator page" do
        end
        it "allows user to access if admin" do
        end
    end
end